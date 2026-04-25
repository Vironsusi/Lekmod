#pragma once
/*	-------------------------------------------------------------------------------------------------------
	Author:  Loupgarou, 2026
	Recreation of the Beyond Earth concepts in the Civ5 dll, for modding and learning purposes.

	1991-2012 Take-Two Interactive Software and its subsidiaries.
	Sid Meier's Civilization V, Civ, Civilization, 2K Games, Firaxis Games, Take-Two Interactive Software
	and their respective logos are all trademarks of Take-Two interactive Software, Inc.
	All other marks and trademarks are the property of their respective owners.
	All rights reserved.
	------------------------------------------------------------------------------------------------------- */
#ifndef CIVBE_BEYOND_EARTH_INFOS_H
#define CIVBE_BEYOND_EARTH_INFOS_H
#if defined(BEYOND_EARTH)
// CvAffinityInfo
class CvAffinityEntry : public CvBaseInfo
{
public:
	CvAffinityEntry(void);
	~CvAffinityEntry(void);
	virtual bool CacheResults(Database::Results& kResults, CvDatabaseUtility& kUtility);
	// Accessor Functions
	int GetAffinityLevelPoints(int i) const;
private:
};
// CvAffinityXMLEntries
class CvAffinityXMLEntries
{
	public:
	CvAffinityXMLEntries(void);
	~CvAffinityXMLEntries(void);
	std::vector<CvAffinityEntry*>& getAffinityEntries();
	int getNumAffinities() const;
	CvAffinityEntry* getAffinityEntry(int index) const;
	void deleteAffinityEntries();
private:
	std::vector<CvAffinityEntry*> m_vAffinityEntries;
};
// CvPlayerAffinities
class CvPlayerAffinities
{
	public:
	CvPlayerAffinities(void);
	~CvPlayerAffinities(void);
	void init(CvAffinityXMLEntries* pAffinities, CvPlayer* pPlayer);
	void uninit();
	void reset();
	void read(FDataStream& kStream);
	void write(FDataStream& kStream) const;
	CvPlayer* getPlayer()						{ return m_pPlayer; }
	CvAffinityXMLEntries* GetAffinities() const	{ return m_pAffinities; }

	AffinityType GetPrimaryAffinity() const		{ return m_ePrimaryAffinity; }
	AffinityType GetSecondaryAffinity() const   { return m_eSecondaryAffinity; }
	
private:
	CvPlayer* m_pPlayer;
	CvAffinityXMLEntries* m_pAffinities;

	AffinityType m_ePrimaryAffinity;
	AffinityType m_eSecondaryAffinity;
};

// Perks seems to be how the game handles Quest Rewards and some parts of the changed Diplomacy system.
// CvPlayerPerkEntry
class CvPlayerPerkEntry : public CvBaseInfo
{
public:
	CvPlayerPerkEntry(void);
	~CvPlayerPerkEntry(void);
	virtual bool CacheResults(Database::Results& kResults, CvDatabaseUtility& kUtility);
	// Accessor Functions (Non-Arrays)
	int GetExclusiveGroup() const				{ return m_iExclusiveGroup; }
	int GetWorkerWorkRateChange() const			{ return m_iWorkerWorkRateChange; }
	int GetNumCovertAgents() const				{ return m_iNumCovertAgents; }
	int GetNumExtraExpeditions() const			{ return m_iNumExtraExpeditions; }
	int GetUnitHealChange() const				{ return m_iUnitHealChange; }
	int GetMilitaryProductionModifier() const	{ return m_iMilitaryProductionModifier; }
	// Accessor Functions (Arrays)
	int GetBuildingCityHitPointsChange(int i) const				  { return m_piBuildingCityHitPointsChange ? m_piBuildingCityHitPointsChange[i] : 0; }
	int GetBuildingCityStrengthChange(int i) const				  { return m_piBuildingCityStrengthChange ? m_piBuildingCityStrengthChange[i] : 0; }
	int GetBuildingOrbitalCoverageChange(int i) const			  { return m_piBuildingOrbitalCoverageChange ? m_piBuildingOrbitalCoverageChange[i] : 0; }
	int GetBuildingClassYieldChange(int i, int j) const			  { return m_ppaiBuildingClassYieldChange ? m_ppaiBuildingClassYieldChange[i][j] : 0; }
	int GetBuildingClassYieldModifier(int i, int j) const		  { return m_ppaiBuildingClassYieldModifier ? m_ppaiBuildingClassYieldModifier[i][j] : 0; }
	int GetAffinityPoints(int i) const							  { return m_piAffinityPoints ? m_piAffinityPoints[i] : 0; }
	int GetYieldBurst(int i) const								  { return m_piYieldBurst ? m_piYieldBurst[i] : 0; }
	int GetYieldBurstPerCity(int i) const						  { return m_piYieldBurstPerCity ? m_piYieldBurstPerCity[i] : 0; }
	int GetUnitDomainMoveChange(int i) const					  { return m_piUnitDomainMoveChange ? m_piUnitDomainMoveChange[i] : 0; }
	int GetUnitCombatMoveChange(int i) const					  { return m_piUnitCombatMoveChange ? m_piUnitCombatMoveChange[i] : 0; }
	bool IsBuildingMaintenanceFree(BuildingTypes eBuilding) const { return NO_BUILDING != eBuilding ? m_vbBuildingMaintenanceFree[eBuilding] : false; }
private:
	int m_iExclusiveGroup; 
	int m_iWorkerWorkRateChange;//
	int m_iNumCovertAgents;//
	int m_iNumExtraExpeditions;
	int m_iUnitHealChange;//
	int m_iMilitaryProductionModifier;//
	int* m_piBuildingCityHitPointsChange;//
	int* m_piBuildingCityStrengthChange;//
	int* m_piBuildingOrbitalCoverageChange;//
	int** m_ppaiBuildingClassYieldChange;//
	int** m_ppaiBuildingClassYieldModifier;//
	int* m_piAffinityPoints;
	int* m_piYieldBurst;//
	int* m_piYieldBurstPerCity;//
	int* m_piUnitDomainMoveChange;//
	int* m_piUnitCombatMoveChange;//
	std::vector<bool> m_vbBuildingMaintenanceFree;//
};
// CvPlayerPerkXMLEntries
class CvPlayerPerkXMLEntries
{
public:
	CvPlayerPerkXMLEntries(void)  { }
	~CvPlayerPerkXMLEntries(void) { deletePlayerPerkEntries(); }

	const std::vector<CvPlayerPerkEntry*>& getPlayerPerkEntries() { return m_vPlayerPerkEntries; }
	int getNumPlayerPerks() const								  { return static_cast<int>(m_vPlayerPerkEntries.size()); }
	CvPlayerPerkEntry* getPlayerPerkEntry(int index) const		  { return (index >= 0 && index < static_cast<int>(m_vPlayerPerkEntries.size())) ? m_vPlayerPerkEntries[index] : NULL; }
	void deletePlayerPerkEntries();
private:
	std::vector<CvPlayerPerkEntry*> m_vPlayerPerkEntries;
};
// CvPlayerPerks
class CvPlayerPerks
{
	public:
	CvPlayerPerks(void);
	~CvPlayerPerks(void);
	void init(CvPlayerPerkXMLEntries* pPerks, CvPlayer* pPlayer);
	void uninit();
	void reset();
	void read(FDataStream& kStream);
	void write(FDataStream& kStream) const;
	CvPlayer* getPlayer()							{ return m_pPlayer; }
	std::vector<int> getActivePerks() const			{ return m_vActivePerks; }
	CvPlayerPerkXMLEntries* GetPlayerPerks() const  { return m_pPerks; }

	bool hasEverHadPerk(PlayerPerkType eIndex) const { return m_pabEverHadPerk ? m_pabEverHadPerk[eIndex] : false; }
	int getNumActivePerks() const					 { return (int)m_vActivePerks.size(); }
	bool isPerkActive(PlayerPerkType eIndex) const	 { return m_pabActivePerks ? m_pabActivePerks[eIndex] : false; }

	void setPerkActive(PlayerPerkType eIndex, bool bNewValue);
	void updatePerkValues(PlayerPerkType ePerk, bool bAdd);
	bool HasPerkInExclusiveGroup(PlayerPerkType eIndex) const; // Checks if the player has any perk active in the same exclusive group as the given perk.
	bool CanHavePerk(PlayerPerkType eIndex) const; // Checks if the player meets the prereqs for the perk, not whether they have it or not.

	// Accessor Functions (Non-Array), only for things that need to be accessed instead of being loaded into the player objects.
	int GetUnitHealChange() const { return m_iUnitHealChange; }
	// Accessor Functions (Array) 
	int GetUnitDomainMoveChange(DomainTypes eDomain) const				{ return NO_DOMAIN != eDomain ? m_viUnitDomainMoveChange[eDomain] : 0; }
	int GetUnitCombatMoveChange(UnitCombatTypes eCombat) const			{ return NO_UNITCOMBAT != eCombat ? m_viUnitCombatMoveChange[eCombat] : 0; }
	int GetBuildingCityHitPointsChange(BuildingTypes eBuilding) const	{ return NO_BUILDING != eBuilding ? m_viBuildingCityHitPointsChange[eBuilding] : 0; }
	int GetBuildingCityStrengthChange(BuildingTypes eBuilding) const	{ return NO_BUILDING != eBuilding ? m_viBuildingCityStrengthChange[eBuilding] : 0; }
	int GetBuildingOrbitalCoverageChange(BuildingTypes eBuilding) const { return NO_BUILDING != eBuilding ? m_viBuildingOrbitalCoverageChange[eBuilding] : 0; }
	bool IsBuildingMaintenanceFree(BuildingTypes eBuilding) const		{ return NO_BUILDING != eBuilding ? m_vbBuildingMaintenanceFree[eBuilding] : false; }
private:
	//CvPerkAI* m_pPerkAI; 
	bool* m_pabActivePerks; // Parallel array to m_vActivePerks for quick lookup of whether a perk is active or not, for when we just want to check a single perk.
	bool* m_pabEverHadPerk; // For tracking if the player has benefited from any of the oneshot effects of a perk. multiadoption shouldnt really be a thing but mods might just.
	CvPlayer* m_pPlayer;
	CvPlayerPerkXMLEntries* m_pPerks;
	std::vector<int> m_vActivePerks; // For iterating over active perks without having to do the bool array and GC.getNumPlayerPerks() loop every time.

	// Member Variables
	int m_iUnitHealChange;

	std::vector<int> m_viUnitDomainMoveChange;
	std::vector<int> m_viUnitCombatMoveChange;
	std::vector<int> m_viBuildingCityHitPointsChange;
	std::vector<int> m_viBuildingCityStrengthChange;
	std::vector<int> m_viBuildingOrbitalCoverageChange;
	std::vector<bool> m_vbBuildingMaintenanceFree;
};

// CvUnitPerkEntry
class CvUnitPerkEntry : public CvBaseInfo
{
public:
	CvUnitPerkEntry(void);
	~CvUnitPerkEntry(void);
	virtual bool CacheResults(Database::Results& kResults, CvDatabaseUtility& kUtility);
	// Accessor Functions (Non-Arrays)
private:

};
// CvUnitPerkXMLEntries
class CvUnitPerkXMLEntries
{
public:
	CvUnitPerkXMLEntries(void);
	~CvUnitPerkXMLEntries(void);

	std::vector<CvUnitPerkEntry*>& getUnitPerkEntries();
	int getNumUnitPerks() const;
	CvUnitPerkEntry* getUnitPerkEntry(int index) const;
	void deleteUnitPerkEntries();
private:
	std::vector<CvUnitPerkEntry*> m_vUnitPerkEntries;
};
// CvUnitPerks
class CvUnitPerks
{
	public:
	CvUnitPerks(void);
	~CvUnitPerks(void);
	void init(CvUnitPerkXMLEntries* pPerks);
	void uninit();
	void reset();
	void read(FDataStream& kStream);
	void write(FDataStream& kStream) const;
	CvPlayer* getPlayer()						{ return m_pPlayer; }
	CvUnitPerkXMLEntries* GetUnitPerks() const	{ return m_pPerks; }
	std::vector<int> getActivePerks() const		{ return m_vActivePerks; }
	// Accessor Functions (Non-Array)
	// Accessor Functions (Array)
private:
	bool* m_pabActivePerks; // Parallel array to m_vActivePerks for quick lookup of whether a perk is active or not, for when we just want to check a single perk.
	CvPlayer* m_pPlayer;
	CvUnitPerkXMLEntries* m_pPerks;
	std::vector<int> m_vActivePerks; // For iterating over active perks without having to do the bool array and GC.getNumUnitPerks() loop every time.
};

// CvQuestEntry
class CvQuestEntry : public CvBaseInfo
{
public:
	CvQuestEntry(void);
	~CvQuestEntry(void);
	virtual bool CacheResults(Database::Results& kResults, CvDatabaseUtility& kUtility);
	// Accessor Functions (Non-Arrays)
	AffinityType getAffinityType() const { return m_eAffinityType; }
	// Triggers
	bool isVictoryQuest() const { return m_bVictoryQuest; }
	bool isResourcePod() const { return m_bResourcePod; }
	int getTurnPrerequisite() const { return m_iTurnPrerequisite; } // Quests that require you to reach a certain turn number before they can be active.
	int getAffinityTurnLimit() const { return m_iAffinityTurnLimit; } // Quests that require you to earn an affinity level within a certain number of turns. -1 for no limit.
	UnitTypes getUnitRequired() const { return m_eUnitRequired; } // this is the unit you need to have seen to trigger the quest, not necessarily the unit you need to have to complete it.
	ImprovementTypes getImprovementRequired() const { return m_eImprovementRequired; }
	BuildingTypes getBuildingRequired() const { return m_eBuildingRequired; }
	std::vector<int> getPrereqQuests() const { return m_vPrereqQuests; } // One or more quests that must be completed before this quest can be active.
	std::vector<int> getPrereqPerks() const { return m_vPrereqPerks; } // One or more perks that must be active before this quest can be active.
	std::vector<int> getPerkRewardOptions() const { return m_vPerkRewardOptions; } // One or more perks that can be rewarded for completing this quest. The player gets to choose one of them.
private:
	AffinityType m_eAffinityType;

	bool m_bVictoryQuest;
	bool m_bResourcePod;
	int m_iTurnPrerequisite;
	int m_iAffinityTurnLimit;
	UnitTypes m_eUnitRequired;
	ImprovementTypes m_eImprovementRequired;
	BuildingTypes m_eBuildingRequired;
	std::vector<int> m_vPrereqQuests;
	std::vector<int> m_vPrereqPerks;
	std::vector<int> m_vPerkRewardOptions;
};
// CvQuestXMLEntries
class CvQuestXMLEntries
{
	public:
	CvQuestXMLEntries(void);
	~CvQuestXMLEntries(void);

	std::vector<CvQuestEntry*>& getQuestEntries();
	int getNumQuests() const;
	CvQuestEntry* getQuestEntry(int index) const;
	void deleteQuestEntries();
private:
	std::vector<CvQuestEntry*> m_vQuestEntries;
};
// CvPlayerQuests
class CvPlayerQuests
{
public:
	CvPlayerQuests(void);
	~CvPlayerQuests(void);
	void init(CvQuestXMLEntries* pQuests, CvPlayer* pPlayer);
	void uninit();
	void reset();
	void read(FDataStream& kStream);
	void write(FDataStream& kStream) const;
	void doTurn(); // Checks for new quests to activate as it's a chance based event.
	CvPlayer* getPlayer();
	std::vector<int> getActiveQuests() const;
	bool isQuestActive(QuestType eIndex) const { return std::find(m_vActiveQuests.begin(), m_vActiveQuests.end(), eIndex) != m_vActiveQuests.end(); }
	void startQuest(QuestType eIndex, bool bNewValue);
	bool hasCompletedQuest(QuestType eIndex) const { return std::find(m_vCompletedQuests.begin(), m_vCompletedQuests.end(), eIndex) != m_vCompletedQuests.end(); }
	void setCompletedQuest(QuestType eIndex, bool bNewValue);
private:
	CvPlayer* m_pPlayer;
	CvQuestXMLEntries* m_pQuests;
	std::vector<int> m_vActiveQuests;
	std::vector<int> m_vCompletedQuests;
};

// Kinda bad name, but this is the pregame bonuses, like Colonists, Spaceship type and other stuff.
// CvSpaceshipStatsEntry
// CvSpaceshipStatsXMLEntries
// CvPlayerSpaceshipStats

/* On the topic of Orbitals
so the question is the method of holding this.
the Player should hold their own OrbitalCoverage as making each plot hold what player has coverage seems awkward.
due to the Abyssal Mirror world wonder the plot is a non start for holding it as it allows for overlapping active coverage for orbitals launched from that city.
so to decide where an orbital can be set requires the City to be considered, even though the orbital coverage means you can place an orbital anywhere you have it.
the way its handled, as seen in the database, is some like the TradeRoute. there is an immobile source unit, that is killed on the success of the deployment of the orbital it represents.
and with orbitals not being returned (outside of 1) this makes me question the need for this difference at all, like why make the OrbitalUnit table at all and just handle the Orbit and Deorbit as missions

so there should be a function on the unit, something like canOrbitHere(plot); that also grabs the city its currently in with plot() -> GC.getMap().getPlotCity()

*/

#endif
#endif // CIVBE_BEYOND_EARTH_INFOS_H