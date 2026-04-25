// Author:  Loupgarou, 2026
// Recreation of the Beyond Earth concepts in the Civ5 dll, for modding and learning purposes.
//
// 1991-2012 Take-Two Interactive Software and its subsidiaries.
// Sid Meier's Civilization V, Civ, Civilization, 2K Games, Firaxis Games, Take-Two Interactive Software
// and their respective logos are all trademarks of Take-Two interactive Software, Inc.
// All other marks and trademarks are the property of their respective owners.
// All rights reserved.
#include "CvGameCoreDLLPCH.h"
#include "CvGameCoreDLLUtil.h"
#include "CvPolicyAI.h"
#include "CvFlavorManager.h"
#include "ICvDLLUserInterface.h"
#include "CvGameCoreUtils.h"
#include "CvEconomicAI.h"
#include "CvGrandStrategyAI.h"
#include "CvInfosSerializationHelper.h"

// Include this after all other headers.
#include "LintFree.h"
#if defined(BEYOND_EARTH)
// CvAffinityEntry
// CvAffinityXMLEntries
// CvPlayerAffinities

// Constructor
CvPlayerPerkEntry::CvPlayerPerkEntry(void):
	m_iWorkerWorkRateChange(0),
	m_iNumCovertAgents(0),
	m_iNumExtraExpeditions(0),
	m_iUnitHealChange(0),
	m_iMilitaryProductionModifier(0),
	m_piBuildingCityHitPointsChange(NULL),
	m_piBuildingCityStrengthChange(NULL),
	m_piBuildingOrbitalCoverageChange(NULL),
	m_ppaiBuildingClassYieldChange(NULL),
	m_ppaiBuildingClassYieldModifier(NULL),
	m_piAffinityPoints(NULL),
	m_piYieldBurst(NULL),
	m_piYieldBurstPerCity(NULL),
	m_piUnitDomainMoveChange(NULL),
	m_piUnitCombatMoveChange(NULL)
{
}
// Destructor
CvPlayerPerkEntry::~CvPlayerPerkEntry(void)
{
	SAFE_DELETE_ARRAY(m_piBuildingCityHitPointsChange);
	SAFE_DELETE_ARRAY(m_piBuildingCityStrengthChange);
	SAFE_DELETE_ARRAY(m_piBuildingOrbitalCoverageChange);
	SAFE_DELETE_ARRAY(m_piAffinityPoints);
	SAFE_DELETE_ARRAY(m_piYieldBurst);
	SAFE_DELETE_ARRAY(m_piYieldBurstPerCity);
	SAFE_DELETE_ARRAY(m_piUnitDomainMoveChange);
	SAFE_DELETE_ARRAY(m_piUnitCombatMoveChange);

	CvDatabaseUtility::SafeDelete2DArray(m_ppaiBuildingClassYieldChange);
	CvDatabaseUtility::SafeDelete2DArray(m_ppaiBuildingClassYieldModifier);
}
// Query Database
bool CvPlayerPerkEntry::CacheResults(Database::Results& kResults, CvDatabaseUtility& kUtility)
{
	if (!CvBaseInfo::CacheResults(kResults, kUtility))
		return false;

	m_iWorkerWorkRateChange = kResults.GetInt("WorkerWorkRateChange");
	m_iNumCovertAgents = kResults.GetInt("NumCovertAgents");
	m_iNumExtraExpeditions = kResults.GetInt("NumExtraExpeditions");
	m_iUnitHealChange = kResults.GetInt("UnitHealChange");
	m_iMilitaryProductionModifier = kResults.GetInt("MilitaryProductionModifier");

	const char* szPerk = GetType();
	std::string key;
	// Prebuilt Helpers
	kUtility.SetAffinities(m_piAffinityPoints, "PlayerPerk_AffinityPoints", "PlayerPerkType", szPerk);
	// Building Maintenance Free
	{
		for (int building = 0; building < GC.getNumBuildingInfos(); building++)
		{
			m_vbBuildingMaintenanceFree.push_back(false);
		}
		key = "PlayerPerk_BuildingMaintenanceFree";
		Database::Results* results = kUtility.GetResults(key);
		if (results == NULL)
		{
			const char* query =
				"SELECT BuildingClasses.ID as BuildingClassID "
				"FROM PlayerPerk_BuildingMaintenanceFree "
				"INNER JOIN BuildingClasses on BuildingClasses.Type = PlayerPerk_BuildingMaintenanceFree.BuildingClassType "
				"WHERE PlayerPerk_BuildingMaintenanceFree.PerkType = ?";
			results = kUtility.PrepareResults(key, query);
		}
		results->Bind(1, szPerk);
		while (results->Step())
		{
			const int buildingClassID = results->GetInt(0);
			m_vbBuildingMaintenanceFree[buildingClassID] = true;
		}
		results->Reset();
	}
	// YieldBurst
	{
		kUtility.InitializeArray(m_piYieldBurst, "Yields");
		kUtility.InitializeArray(m_piYieldBurstPerCity, "Yields");
		key = "PlayerPerk_YieldBurst";
		Database::Results* results = kUtility.GetResults(key);
		if (results == NULL)
		{
			const char* query =
				"SELECT Yields.ID as YieldID, Yield, YieldPerCity "
				"FROM PlayerPerk_YieldBurst "
				"INNER JOIN Yields on Yields.Type = PlayerPerk_YieldBurst.YieldType "
				"WHERE PlayerPerk_YieldBurst.PerkType = ?";
			results = kUtility.PrepareResults(key, query);
		}
		results->Bind(1, szPerk);
		while (results->Step())
		{
			const int yieldID = results->GetInt(0);
			const int yieldBurst = results->GetInt(1);
			const int yieldPerCity = results->GetInt(2);
			m_piYieldBurst[yieldID] = yieldBurst;
			m_piYieldBurstPerCity[yieldID] = yieldPerCity;
		}
		results->Reset();
	}
	// UnitDomain and UnitCombat MoveChange
	{
		kUtility.InitializeArray(m_piUnitCombatMoveChange, "Domains");
		kUtility.InitializeArray(m_piUnitDomainMoveChange, "UnitCombatInfos");
		key = "PlayerPerk_UnitMoveChanges";
		Database::Results* results = kUtility.GetResults(key);
		if (results == NULL)
		{
			const char* query =
				"SELECT Domains.ID as DomainID, UnitCombatInfos.ID as CombatClassID, MoveChange "
				"FROM PlayerPerk_UnitMoveChanges "
				"INNER JOIN Domains ON Domains.Type = DomainType "
				"INNER JOIN UnitCombatInfos ON UnitCombatInfos.Type = UnitCombatType "
				"WHERE PlayerPerk_UnitMoveChanges.PerkType = ?";
			results = kUtility.PrepareResults(key, query);
		}
		results->Bind(1, szPerk);
		while (results->Step())
		{
			const int domain = results->GetInt(0);
			const int combatClass = results->GetInt(1);
			const int moves = results->GetInt(2);

			m_piUnitCombatMoveChange[combatClass] = moves;
			m_piUnitDomainMoveChange[domain] = moves;
		}
		results->Reset();
	}
	// BuildingClassYieldChanges and YieldModifiers
	{
		kUtility.Initialize2DArray(m_ppaiBuildingClassYieldChange, "BuildingClasses", "Yields");
		kUtility.Initialize2DArray(m_ppaiBuildingClassYieldModifier, "BuildingClasses", "Yields");
		key = "PlayerPerk_BuildingClassYieldChanges";
		Database::Results* results = kUtility.GetResults(key);
		if (results == NULL)
		{
			// Note: use key.element since there can be some ambiguity in the column names which will cause failures.
			const char* query =
				"SELECT BuildingClasses.ID as BuildingClassID, Yields.ID as YieldID, YieldChange, YieldModifier "
				"FROM PlayerPerk_BuildingClassYieldChanges "
				"INNER JOIN BuildingClasses on BuildingClasses.Type = PlayerPerk_BuildingClassYieldChanges.BuildingClassType "
				"INNER JOIN Yields on Yields.Type = PlayerPerk_BuildingClassYieldChanges.YieldType "
				"WHERE PlayerPerk_BuildingClassYieldChanges.PerkType = ?";
			results = kUtility.PrepareResults(key, query);
		}
		results->Bind(1, szPerk);
		while (results->Step())
		{
			const int buildingClassID = results->GetInt(0);
			const int iYieldID = results->GetInt(1);
			const int iYieldChange = results->GetInt(2);
			const int iYieldModifier = results->GetInt(3);
			m_ppaiBuildingClassYieldChange[buildingClassID][iYieldID] = iYieldChange;
			m_ppaiBuildingClassYieldModifier[buildingClassID][iYieldID] = iYieldModifier;
		}
		results->Reset();
	}
	// BuldingClassCityHitPointsChange and StrengthChange.
	{
		kUtility.InitializeArray(m_piBuildingCityHitPointsChange, "BuildingClasses");
		kUtility.InitializeArray(m_piBuildingCityStrengthChange, "BuildingClasses");
		key = "PlayerPerk_BuildingClassCityDefenseChanges";
		Database::Results* results = kUtility.GetResults(key);
		if (results == NULL)
		{
			const char* query =
				"SELECT BuildingClasses.ID as BuildingClassID, CityHitPointsChange, CityStrengthChange "
				"FROM PlayerPerk_BuildingClassCityDefenseChanges "
				"INNER JOIN BuildingClasses on BuildingClasses.Type = PlayerPerk_BuildingClassCityDefenseChanges.BuildingClassType "
				"WHERE PlayerPerk_BuildingClassCityDefenseChanges.PerkType = ?";
			results = kUtility.PrepareResults(key, query);
		}
		results->Bind(1, szPerk);
		while (results->Step())
		{
			const int buildingClassID = results->GetInt(0);
			const int iCityHitPointsChange = results->GetInt(1);
			const int iCityStrengthChange = results->GetInt(2);
			m_piBuildingCityHitPointsChange[buildingClassID] = iCityHitPointsChange;
			m_piBuildingCityStrengthChange[buildingClassID] = iCityStrengthChange;
		}
		results->Reset();
	}
	//OrbitalCoverageChange of a Building
	{
		kUtility.InitializeArray(m_piBuildingOrbitalCoverageChange, "Buildings");
		key = "PlayerPerk_BuildingOrbitalCoverageChange";
		Database::Results* results = kUtility.GetResults(key);
		if (results == NULL)
		{
			const char* query =
				"SELECT Buildings.ID as BuildingID, OrbitalCoverageChange "
				"FROM PlayerPerk_BuildingOrbitalCoverageChange "
				"INNER JOIN Buildings on Buildings.Type = PlayerPerk_BuildingOrbitalCoverageChange.BuildingType "
				"WHERE PlayerPerk_BuildingOrbitalCoverageChange.PerkType = ?";
		}
		results->Bind(1, szPerk);
		while (results->Step())
		{
			const int building = results->GetInt(0);
			const int orbitalChange = results->GetInt(1);
			m_piBuildingOrbitalCoverageChange[building] = orbitalChange;
		}
		results->Reset();
	}
	return true;
}
//=====================================
// CvPlayerPerkXMLEntries
//=====================================
CvPlayerPerkXMLEntries::CvPlayerPerkXMLEntries(void)
{
}
void CvPlayerPerkXMLEntries::deletePlayerPerkEntries()
{
	for (std::vector<CvPlayerPerkEntry*>::iterator it = m_vPlayerPerkEntries.begin(); it != m_vPlayerPerkEntries.end(); ++it)
	{
		SAFE_DELETE(*it);
	}
	m_vPlayerPerkEntries.clear();
}
//=====================================
// CvPlayerPerks
//=====================================
CvPlayerPerks::CvPlayerPerks(void):
	//m_pPerkAI(NULL),
	m_pabActivePerks(NULL),
	m_pabEverHadPerk(NULL),
	m_pPlayer(NULL),
	m_pPerks(NULL)
{
}
CvPlayerPerks::~CvPlayerPerks(void)
{
}

void CvPlayerPerks::init(CvPlayerPerkXMLEntries* pPerks, CvPlayer* pPlayer)
{
	m_pPerks = pPerks;
	m_pPlayer = pPlayer;

	m_pabActivePerks = FNEW(bool[GC.getNumPlayerPerkInfos()], c_eCiv5GameplayDLL, 0);
	m_pabEverHadPerk = FNEW(bool[GC.getNumPlayerPerkInfos()], c_eCiv5GameplayDLL, 0);
	// m_pPerkAI = FNEW(CvPerkAI(this), c_eCiv5GameplayDLL, 0);

	reset();

}

void CvPlayerPerks::uninit()
{
	m_pPerks = NULL;
	m_pPlayer = NULL;
	m_vActivePerks.clear();
	SAFE_DELETE_ARRAY(m_pabActivePerks);
	SAFE_DELETE_ARRAY(m_pabEverHadPerk);
	// SAFE_DELETE(m_pPerkAI);

	m_viUnitDomainMoveChange.clear();
	m_viUnitCombatMoveChange.clear();
	m_viBuildingCityHitPointsChange.clear();
	m_viBuildingCityStrengthChange.clear();
	m_viBuildingOrbitalCoverageChange.clear();
	m_vbBuildingMaintenanceFree.clear();
}

void CvPlayerPerks::reset()
{
	// Single value variables
	m_iUnitHealChange = 0;
	Firaxis::Array< int, NUM_YIELD_TYPES > yield;
	for (unsigned int j = 0; j < NUM_YIELD_TYPES; ++j)
	{
		yield[j] = 0;
	}
	// Units
	m_viUnitDomainMoveChange.clear();
	m_viUnitDomainMoveChange.resize(NUM_DOMAIN_TYPES);
	for (int i = 0; i < NUM_DOMAIN_TYPES; i++)
	{
		m_viUnitDomainMoveChange[i] = 0;
	}
	m_viUnitCombatMoveChange.clear();
	m_viUnitCombatMoveChange.resize(GC.getNumUnitCombatClassInfos());
	for (int i = 0; i < GC.getNumUnitCombatClassInfos(); i++)
	{
		m_viUnitCombatMoveChange[i] = 0;
	}
	// Buildings
	m_viBuildingCityHitPointsChange.clear();
	m_viBuildingCityHitPointsChange.resize(GC.getNumBuildingInfos());
	m_viBuildingCityStrengthChange.clear();
	m_viBuildingCityStrengthChange.resize(GC.getNumBuildingInfos());
	m_viBuildingOrbitalCoverageChange.clear();
	m_viBuildingOrbitalCoverageChange.resize(GC.getNumBuildingInfos());
	m_vbBuildingMaintenanceFree.clear();
	m_vbBuildingMaintenanceFree.resize(GC.getNumBuildingInfos());
	for (int building = 0; building < GC.getNumBuildingInfos(); building++)
	{
		m_viBuildingCityHitPointsChange[building] = 0;
		m_viBuildingCityStrengthChange[building] = 0;
		m_viBuildingOrbitalCoverageChange[building] = 0;
		m_vbBuildingMaintenanceFree[building] = false;
	}

	//m_pPerkAI->Reset();
}

void CvPlayerPerks::read(FDataStream& kStream)
{
	// Active Perks
	uint uiNumActivePerks;
	kStream >> uiNumActivePerks;
	m_vActivePerks.resize(uiNumActivePerks);
	for (uint i = 0; i < uiNumActivePerks; i++)
	{
		kStream >> m_vActivePerks[i];
	}

	kStream >> m_iUnitHealChange;

	kStream >> m_viUnitDomainMoveChange;
	kStream >> m_viUnitCombatMoveChange;
	kStream >> m_viBuildingCityHitPointsChange;
	kStream >> m_viBuildingCityStrengthChange;
	kStream >> m_viBuildingOrbitalCoverageChange;
	kStream >> m_vbBuildingMaintenanceFree;
}

void CvPlayerPerks::write(FDataStream& kStream) const
{
	// Active Perks
	uint uiNumActivePerks = (uint)m_vActivePerks.size();
	kStream << uiNumActivePerks;
	for (uint i = 0; i < uiNumActivePerks; i++)
	{
		kStream << m_vActivePerks[i];
	}

	kStream << m_iUnitHealChange;
	
	kStream << m_viUnitDomainMoveChange;
	kStream << m_viUnitCombatMoveChange;
	kStream << m_viBuildingCityHitPointsChange;
	kStream << m_viBuildingCityStrengthChange;
	kStream << m_viBuildingOrbitalCoverageChange;
	kStream << m_vbBuildingMaintenanceFree;
}
// Checks if the player has any perk active in the same exclusive group as the given perk.
bool CvPlayerPerks::HasPerkInExclusiveGroup(PlayerPerkType eIndex) const
{
	CvAssertMsg(eIndex >= 0 && eIndex < GetPlayerPerks()->getNumPlayerPerks(), "Invalid perk index.");

	CvPlayerPerkEntry* pPerk = GetPlayerPerks()->getPlayerPerkEntry(eIndex);
	if (pPerk == NULL)
		return false;
	CvPlayerPerkEntry& kPerk = *pPerk;
	const int iExclusiveGroup = kPerk.GetExclusiveGroup();
	if (iExclusiveGroup == -1)
		return false; // No exclusive group, so no perks are mutually exclusive with this one.
	std::vector<int>& vPerks = getActivePerks();
	for (std::vector<int>::const_iterator it = vPerks.begin(); it != vPerks.end(); ++it)
	{
		CvPlayerPerkEntry* pLoopPerk = GetPlayerPerks()->getPlayerPerkEntry(*it);
		if (pLoopPerk && pLoopPerk->GetExclusiveGroup() == iExclusiveGroup)
			return true;
	}
	return false;
}
// Can the Player have this Perk?
bool CvPlayerPerks::CanHavePerk(PlayerPerkType ePerk) const
{
	CvAssertMsg(ePerk >= 0 && ePerk < GetPlayerPerks()->getNumPlayerPerks(), "Invalid perk index.");

	CvPlayerPerkEntry* pPerk = GetPlayerPerks()->getPlayerPerkEntry(ePerk);
	if (pPerk == NULL)
		return false;
	CvPlayerPerkEntry& kPerk = *pPerk;

	if (isPerkActive(ePerk))
		return false;

	if (HasPerkInExclusiveGroup(ePerk))
		return false;

	ICvEngineScriptSystem1* pkScriptSystem = gDLL->GetScriptSystem();
	if (pkScriptSystem)
	{
		CvLuaArgsHandle args;
		args->Push(m_pPlayer->GetID());
		args->Push(ePerk);

		// Attempt to execute the game events.
		// Will return false if there are no registered listeners.
		bool bResult = false;
		LuaSupport::CallHook(pkScriptSystem, "PlayerCanHavePerk", args.get(), bResult);
	}

	return true;
}
// Set the perk state
void CvPlayerPerks::setPerkActive(PlayerPerkType eIndex, bool bNewValue)
{
	CvAssertMsg(eIndex >= 0 && eIndex < GetPlayerPerks()->getNumPlayerPerks(), "Invalid perk index.");
	std::vector<int>::iterator it = std::find(m_vActivePerks.begin(), m_vActivePerks.end(), eIndex);
	const bool bCurrentlyActive = isPerkActive(eIndex);
	if (isPerkActive(eIndex) != bNewValue) // Only do something if the state changes.
	{
		m_pabActivePerks[eIndex] = bNewValue;
		bNewValue ? m_vActivePerks.push_back(eIndex) : m_vActivePerks.erase(it);
		m_pabEverHadPerk[eIndex] = true;
		updatePerkValues(eIndex, bNewValue);
	}
}
// Update the quick lookup values that aren't loaded directly into the player.
void CvPlayerPerks::updatePerkValues(PlayerPerkType ePerk, bool bAdd)
{
	// If negative we are removing the Perk, positive we are adding it.
	int Change = bAdd ? 1 : -1;
	//int ValueChange = 0;
	CvPlayerPerkEntry* pPerk = GetPlayerPerks()->getPlayerPerkEntry(ePerk);
	if (pPerk == NULL)
		return;
	const CvPlayerPerkEntry& kPerk = *pPerk;

	m_iUnitHealChange += kPerk.GetUnitHealChange() * Change;

	for (int building = 0; building < GC.getNumBuildingInfos(); building++)
	{
		m_viBuildingCityHitPointsChange[building] += kPerk.GetBuildingCityHitPointsChange(building) * Change;
		m_viBuildingCityStrengthChange[building] += kPerk.GetBuildingCityStrengthChange(building) * Change;
		m_viBuildingOrbitalCoverageChange[building] += kPerk.GetBuildingOrbitalCoverageChange(building) * Change;
		if (kPerk.IsBuildingMaintenanceFree(static_cast<BuildingTypes>(building))) // So other perks don't flip this back when they are not meant to change it.
			m_vbBuildingMaintenanceFree[building] = Change == 1 ? true : false;
	}
	for (int domain = 0; domain < NUM_DOMAIN_TYPES; domain++)
	{
		m_viUnitDomainMoveChange[domain] += kPerk.GetUnitDomainMoveChange(domain) * Change;
	}
	for (int combatClass = 0; combatClass < GC.getNumUnitCombatClassInfos(); combatClass++)
	{
		m_viUnitCombatMoveChange[combatClass] += kPerk.GetUnitCombatMoveChange(combatClass) * Change;
	}

}

// CvUnitPerkEntry
// CvUnitPerkXMLEntries
// CvUnitPerks

// CvQuestEntry
// CvQuestXMLEntries
// CvPlayerQuests
#endif