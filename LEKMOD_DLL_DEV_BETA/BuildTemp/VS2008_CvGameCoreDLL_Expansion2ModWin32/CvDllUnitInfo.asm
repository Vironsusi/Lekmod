; Listing generated by Microsoft (R) Optimizing Compiler Version 15.00.30729.01 

	TITLE	c:\Users\EnormousApplePie\Desktop\Lekmod DLL versions\v31\LEKMOD_DLL\CvGameCoreDLL_Expansion2\CvDllUnitInfo.cpp
	.686P
	.XMM
	include listing.inc
	.model	flat

INCLUDELIB MSVCRT
INCLUDELIB OLDNAMES

_DATA	SEGMENT
_CIV5_XP2_DLL_VERSION DD FLAT:$SG217155
_DATA	ENDS
CONST	SEGMENT
$SG217155 DB	'1.0.0', 00H
	ORG $+2
_guidICvUnknown DD 0d89ba82fH
	DW	09fa3H
	DW	04696H
	DB	0b3H
	DB	0f4H
	DB	052H
	DB	0bdH
	DB	0b1H
	DB	01H
	DB	0cfH
	DB	0b2H
_guidICvUnitInfo1 DD 078f0497aH
	DW	07a44H
	DW	049a0H
	DB	08dH
	DB	014H
	DB	058H
	DB	0aaH
	DB	0b8H
	DB	0c1H
	DB	028H
	DB	0b8H
CONST	ENDS
PUBLIC	??_7ICvUnknown@@6B@				; ICvUnknown::`vftable'
PUBLIC	??0ICvUnknown@@QAE@XZ				; ICvUnknown::ICvUnknown
PUBLIC	??_R4ICvUnknown@@6B@				; ICvUnknown::`RTTI Complete Object Locator'
PUBLIC	??_R0?AVICvUnknown@@@8				; ICvUnknown `RTTI Type Descriptor'
PUBLIC	??_R3ICvUnknown@@8				; ICvUnknown::`RTTI Class Hierarchy Descriptor'
PUBLIC	??_R2ICvUnknown@@8				; ICvUnknown::`RTTI Base Class Array'
PUBLIC	??_R1A@?0A@EA@ICvUnknown@@8			; ICvUnknown::`RTTI Base Class Descriptor at (0,-1,0,64)'
EXTRN	??_7type_info@@6B@:QWORD			; type_info::`vftable'
EXTRN	__purecall:PROC
;	COMDAT ??_R1A@?0A@EA@ICvUnknown@@8
rdata$r	SEGMENT
??_R1A@?0A@EA@ICvUnknown@@8 DD FLAT:??_R0?AVICvUnknown@@@8 ; ICvUnknown::`RTTI Base Class Descriptor at (0,-1,0,64)'
	DD	00H
	DD	00H
	DD	0ffffffffH
	DD	00H
	DD	040H
	DD	FLAT:??_R3ICvUnknown@@8
rdata$r	ENDS
;	COMDAT ??_R2ICvUnknown@@8
rdata$r	SEGMENT
??_R2ICvUnknown@@8 DD FLAT:??_R1A@?0A@EA@ICvUnknown@@8	; ICvUnknown::`RTTI Base Class Array'
rdata$r	ENDS
;	COMDAT ??_R3ICvUnknown@@8
rdata$r	SEGMENT
??_R3ICvUnknown@@8 DD 00H				; ICvUnknown::`RTTI Class Hierarchy Descriptor'
	DD	00H
	DD	01H
	DD	FLAT:??_R2ICvUnknown@@8
rdata$r	ENDS
;	COMDAT ??_R0?AVICvUnknown@@@8
_DATA	SEGMENT
??_R0?AVICvUnknown@@@8 DD FLAT:??_7type_info@@6B@	; ICvUnknown `RTTI Type Descriptor'
	DD	00H
	DB	'.?AVICvUnknown@@', 00H
_DATA	ENDS
;	COMDAT ??_R4ICvUnknown@@6B@
rdata$r	SEGMENT
??_R4ICvUnknown@@6B@ DD 00H				; ICvUnknown::`RTTI Complete Object Locator'
	DD	00H
	DD	00H
	DD	FLAT:??_R0?AVICvUnknown@@@8
	DD	FLAT:??_R3ICvUnknown@@8
rdata$r	ENDS
;	COMDAT ??_7ICvUnknown@@6B@
CONST	SEGMENT
??_7ICvUnknown@@6B@ DD FLAT:??_R4ICvUnknown@@6B@	; ICvUnknown::`vftable'
	DD	FLAT:__purecall
	DD	FLAT:__purecall
; Function compile flags: /Ogtpy
CONST	ENDS
;	COMDAT ??0ICvUnknown@@QAE@XZ
_TEXT	SEGMENT
??0ICvUnknown@@QAE@XZ PROC				; ICvUnknown::ICvUnknown, COMDAT
; _this$ = ecx
	mov	eax, ecx
	mov	DWORD PTR [eax], OFFSET ??_7ICvUnknown@@6B@
	ret	0
??0ICvUnknown@@QAE@XZ ENDP				; ICvUnknown::ICvUnknown
_TEXT	ENDS
PUBLIC	??_7CvDllUnitInfo@@6B@				; CvDllUnitInfo::`vftable'
PUBLIC	??1CvDllUnitInfo@@QAE@XZ			; CvDllUnitInfo::~CvDllUnitInfo
PUBLIC	??_R4CvDllUnitInfo@@6B@				; CvDllUnitInfo::`RTTI Complete Object Locator'
PUBLIC	??_R0?AVCvDllUnitInfo@@@8			; CvDllUnitInfo `RTTI Type Descriptor'
PUBLIC	??_R3CvDllUnitInfo@@8				; CvDllUnitInfo::`RTTI Class Hierarchy Descriptor'
PUBLIC	??_R2CvDllUnitInfo@@8				; CvDllUnitInfo::`RTTI Base Class Array'
PUBLIC	??_R1A@?0A@EA@CvDllUnitInfo@@8			; CvDllUnitInfo::`RTTI Base Class Descriptor at (0,-1,0,64)'
PUBLIC	??_R1A@?0A@EA@ICvUnitInfo1@@8			; ICvUnitInfo1::`RTTI Base Class Descriptor at (0,-1,0,64)'
PUBLIC	??_R0?AVICvUnitInfo1@@@8			; ICvUnitInfo1 `RTTI Type Descriptor'
PUBLIC	??_R3ICvUnitInfo1@@8				; ICvUnitInfo1::`RTTI Class Hierarchy Descriptor'
PUBLIC	??_R2ICvUnitInfo1@@8				; ICvUnitInfo1::`RTTI Base Class Array'
PUBLIC	?QueryInterface@CvDllUnitInfo@@UAGPAXU_GUID@@@Z	; CvDllUnitInfo::QueryInterface
PUBLIC	?Destroy@CvDllUnitInfo@@EAGXXZ			; CvDllUnitInfo::Destroy
PUBLIC	?GetCombat@CvDllUnitInfo@@UBGHXZ		; CvDllUnitInfo::GetCombat
PUBLIC	?GetDomainType@CvDllUnitInfo@@UBGHXZ		; CvDllUnitInfo::GetDomainType
PUBLIC	?GetType@CvDllUnitInfo@@UBGPBDXZ		; CvDllUnitInfo::GetType
PUBLIC	?GetText@CvDllUnitInfo@@UBGPBDXZ		; CvDllUnitInfo::GetText
PUBLIC	?GetMoveRate@CvDllUnitInfo@@UBG?AUUnitMoveRate@@H@Z ; CvDllUnitInfo::GetMoveRate
PUBLIC	?GetUnitArtInfoTag@CvDllUnitInfo@@UBGPBDXZ	; CvDllUnitInfo::GetUnitArtInfoTag
PUBLIC	?GetUnitArtInfoCulturalVariation@CvDllUnitInfo@@UBG_NXZ ; CvDllUnitInfo::GetUnitArtInfoCulturalVariation
PUBLIC	?GetUnitArtInfoEraVariation@CvDllUnitInfo@@UBG_NXZ ; CvDllUnitInfo::GetUnitArtInfoEraVariation
PUBLIC	?GetUnitFlagIconOffset@CvDllUnitInfo@@UBGHXZ	; CvDllUnitInfo::GetUnitFlagIconOffset
;	COMDAT ??_R2ICvUnitInfo1@@8
; File c:\users\enormousapplepie\desktop\lekmod dll versions\v31\lekmod_dll\cvgamecoredll_expansion2\cvdllunitinfo.cpp
rdata$r	SEGMENT
??_R2ICvUnitInfo1@@8 DD FLAT:??_R1A@?0A@EA@ICvUnitInfo1@@8 ; ICvUnitInfo1::`RTTI Base Class Array'
	DD	FLAT:??_R1A@?0A@EA@ICvUnknown@@8
rdata$r	ENDS
;	COMDAT ??_R3ICvUnitInfo1@@8
rdata$r	SEGMENT
??_R3ICvUnitInfo1@@8 DD 00H				; ICvUnitInfo1::`RTTI Class Hierarchy Descriptor'
	DD	00H
	DD	02H
	DD	FLAT:??_R2ICvUnitInfo1@@8
rdata$r	ENDS
;	COMDAT ??_R0?AVICvUnitInfo1@@@8
_DATA	SEGMENT
??_R0?AVICvUnitInfo1@@@8 DD FLAT:??_7type_info@@6B@	; ICvUnitInfo1 `RTTI Type Descriptor'
	DD	00H
	DB	'.?AVICvUnitInfo1@@', 00H
_DATA	ENDS
;	COMDAT ??_R1A@?0A@EA@ICvUnitInfo1@@8
rdata$r	SEGMENT
??_R1A@?0A@EA@ICvUnitInfo1@@8 DD FLAT:??_R0?AVICvUnitInfo1@@@8 ; ICvUnitInfo1::`RTTI Base Class Descriptor at (0,-1,0,64)'
	DD	01H
	DD	00H
	DD	0ffffffffH
	DD	00H
	DD	040H
	DD	FLAT:??_R3ICvUnitInfo1@@8
rdata$r	ENDS
;	COMDAT ??_R1A@?0A@EA@CvDllUnitInfo@@8
rdata$r	SEGMENT
??_R1A@?0A@EA@CvDllUnitInfo@@8 DD FLAT:??_R0?AVCvDllUnitInfo@@@8 ; CvDllUnitInfo::`RTTI Base Class Descriptor at (0,-1,0,64)'
	DD	02H
	DD	00H
	DD	0ffffffffH
	DD	00H
	DD	040H
	DD	FLAT:??_R3CvDllUnitInfo@@8
rdata$r	ENDS
;	COMDAT ??_R2CvDllUnitInfo@@8
rdata$r	SEGMENT
??_R2CvDllUnitInfo@@8 DD FLAT:??_R1A@?0A@EA@CvDllUnitInfo@@8 ; CvDllUnitInfo::`RTTI Base Class Array'
	DD	FLAT:??_R1A@?0A@EA@ICvUnitInfo1@@8
	DD	FLAT:??_R1A@?0A@EA@ICvUnknown@@8
rdata$r	ENDS
;	COMDAT ??_R3CvDllUnitInfo@@8
rdata$r	SEGMENT
??_R3CvDllUnitInfo@@8 DD 00H				; CvDllUnitInfo::`RTTI Class Hierarchy Descriptor'
	DD	00H
	DD	03H
	DD	FLAT:??_R2CvDllUnitInfo@@8
rdata$r	ENDS
;	COMDAT ??_R0?AVCvDllUnitInfo@@@8
_DATA	SEGMENT
??_R0?AVCvDllUnitInfo@@@8 DD FLAT:??_7type_info@@6B@	; CvDllUnitInfo `RTTI Type Descriptor'
	DD	00H
	DB	'.?AVCvDllUnitInfo@@', 00H
_DATA	ENDS
;	COMDAT ??_R4CvDllUnitInfo@@6B@
rdata$r	SEGMENT
??_R4CvDllUnitInfo@@6B@ DD 00H				; CvDllUnitInfo::`RTTI Complete Object Locator'
	DD	00H
	DD	00H
	DD	FLAT:??_R0?AVCvDllUnitInfo@@@8
	DD	FLAT:??_R3CvDllUnitInfo@@8
rdata$r	ENDS
;	COMDAT ??_7CvDllUnitInfo@@6B@
CONST	SEGMENT
??_7CvDllUnitInfo@@6B@ DD FLAT:??_R4CvDllUnitInfo@@6B@	; CvDllUnitInfo::`vftable'
	DD	FLAT:?QueryInterface@CvDllUnitInfo@@UAGPAXU_GUID@@@Z
	DD	FLAT:?Destroy@CvDllUnitInfo@@EAGXXZ
	DD	FLAT:?GetCombat@CvDllUnitInfo@@UBGHXZ
	DD	FLAT:?GetDomainType@CvDllUnitInfo@@UBGHXZ
	DD	FLAT:?GetType@CvDllUnitInfo@@UBGPBDXZ
	DD	FLAT:?GetText@CvDllUnitInfo@@UBGPBDXZ
	DD	FLAT:?GetMoveRate@CvDllUnitInfo@@UBG?AUUnitMoveRate@@H@Z
	DD	FLAT:?GetUnitArtInfoTag@CvDllUnitInfo@@UBGPBDXZ
	DD	FLAT:?GetUnitArtInfoCulturalVariation@CvDllUnitInfo@@UBG_NXZ
	DD	FLAT:?GetUnitArtInfoEraVariation@CvDllUnitInfo@@UBG_NXZ
	DD	FLAT:?GetUnitFlagIconOffset@CvDllUnitInfo@@UBGHXZ
; Function compile flags: /Ogtpy
CONST	ENDS
;	COMDAT ??1CvDllUnitInfo@@QAE@XZ
_TEXT	SEGMENT
??1CvDllUnitInfo@@QAE@XZ PROC				; CvDllUnitInfo::~CvDllUnitInfo, COMDAT
; _this$ = ecx

; 23   : {

	mov	DWORD PTR [ecx], OFFSET ??_7CvDllUnitInfo@@6B@

; 24   : }

	ret	0
??1CvDllUnitInfo@@QAE@XZ ENDP				; CvDllUnitInfo::~CvDllUnitInfo
_TEXT	ENDS
PUBLIC	?IncrementReference@CvDllUnitInfo@@QAEIXZ	; CvDllUnitInfo::IncrementReference
; Function compile flags: /Ogtpy
;	COMDAT ?IncrementReference@CvDllUnitInfo@@QAEIXZ
_TEXT	SEGMENT
?IncrementReference@CvDllUnitInfo@@QAEIXZ PROC		; CvDllUnitInfo::IncrementReference, COMDAT
; _this$ = ecx

; 40   : 	++m_uiRefCount;

	inc	DWORD PTR [ecx+4]

; 41   : 	return m_uiRefCount;

	mov	eax, DWORD PTR [ecx+4]

; 42   : }

	ret	0
?IncrementReference@CvDllUnitInfo@@QAEIXZ ENDP		; CvDllUnitInfo::IncrementReference
_TEXT	ENDS
PUBLIC	?GetReferenceCount@CvDllUnitInfo@@QAEIXZ	; CvDllUnitInfo::GetReferenceCount
; Function compile flags: /Ogtpy
;	COMDAT ?GetReferenceCount@CvDllUnitInfo@@QAEIXZ
_TEXT	SEGMENT
?GetReferenceCount@CvDllUnitInfo@@QAEIXZ PROC		; CvDllUnitInfo::GetReferenceCount, COMDAT
; _this$ = ecx

; 60   : 	return m_uiRefCount;

	mov	eax, DWORD PTR [ecx+4]

; 61   : }

	ret	0
?GetReferenceCount@CvDllUnitInfo@@QAEIXZ ENDP		; CvDllUnitInfo::GetReferenceCount
_TEXT	ENDS
PUBLIC	??3CvDllUnitInfo@@SAXPAX@Z			; CvDllUnitInfo::operator delete
EXTRN	?Free@CvDllGameContext@@SAXPAX@Z:PROC		; CvDllGameContext::Free
; Function compile flags: /Ogtpy
;	COMDAT ??3CvDllUnitInfo@@SAXPAX@Z
_TEXT	SEGMENT
_p$ = 8							; size = 4
??3CvDllUnitInfo@@SAXPAX@Z PROC				; CvDllUnitInfo::operator delete, COMDAT

; 70   : 	CvDllGameContext::Free(p);

	jmp	?Free@CvDllGameContext@@SAXPAX@Z	; CvDllGameContext::Free
??3CvDllUnitInfo@@SAXPAX@Z ENDP				; CvDllUnitInfo::operator delete
_TEXT	ENDS
PUBLIC	??2CvDllUnitInfo@@SAPAXI@Z			; CvDllUnitInfo::operator new
EXTRN	?Allocate@CvDllGameContext@@SAPAXI@Z:PROC	; CvDllGameContext::Allocate
; Function compile flags: /Ogtpy
;	COMDAT ??2CvDllUnitInfo@@SAPAXI@Z
_TEXT	SEGMENT
_bytes$ = 8						; size = 4
??2CvDllUnitInfo@@SAPAXI@Z PROC				; CvDllUnitInfo::operator new, COMDAT

; 75   : 	return CvDllGameContext::Allocate(bytes);

	jmp	?Allocate@CvDllGameContext@@SAPAXI@Z	; CvDllGameContext::Allocate
??2CvDllUnitInfo@@SAPAXI@Z ENDP				; CvDllUnitInfo::operator new
_TEXT	ENDS
EXTRN	?GetCombat@CvUnitEntry@@QBEHXZ:PROC		; CvUnitEntry::GetCombat
; Function compile flags: /Ogtpy
;	COMDAT ?GetCombat@CvDllUnitInfo@@UBGHXZ
_TEXT	SEGMENT
_this$ = 8						; size = 4
?GetCombat@CvDllUnitInfo@@UBGHXZ PROC			; CvDllUnitInfo::GetCombat, COMDAT

; 80   : 	return m_pUnitInfo->GetCombat();

	mov	eax, DWORD PTR _this$[esp-4]
	mov	ecx, DWORD PTR [eax+8]
	call	?GetCombat@CvUnitEntry@@QBEHXZ		; CvUnitEntry::GetCombat

; 81   : }

	ret	4
?GetCombat@CvDllUnitInfo@@UBGHXZ ENDP			; CvDllUnitInfo::GetCombat
_TEXT	ENDS
EXTRN	?GetDomainType@CvUnitEntry@@QBEHXZ:PROC		; CvUnitEntry::GetDomainType
; Function compile flags: /Ogtpy
;	COMDAT ?GetDomainType@CvDllUnitInfo@@UBGHXZ
_TEXT	SEGMENT
_this$ = 8						; size = 4
?GetDomainType@CvDllUnitInfo@@UBGHXZ PROC		; CvDllUnitInfo::GetDomainType, COMDAT

; 85   : 	return m_pUnitInfo->GetDomainType();

	mov	eax, DWORD PTR _this$[esp-4]
	mov	ecx, DWORD PTR [eax+8]
	call	?GetDomainType@CvUnitEntry@@QBEHXZ	; CvUnitEntry::GetDomainType

; 86   : }

	ret	4
?GetDomainType@CvDllUnitInfo@@UBGHXZ ENDP		; CvDllUnitInfo::GetDomainType
_TEXT	ENDS
EXTRN	?GetText@CvBaseInfo@@QBEPBDXZ:PROC		; CvBaseInfo::GetText
; Function compile flags: /Ogtpy
;	COMDAT ?GetText@CvDllUnitInfo@@UBGPBDXZ
_TEXT	SEGMENT
_this$ = 8						; size = 4
?GetText@CvDllUnitInfo@@UBGPBDXZ PROC			; CvDllUnitInfo::GetText, COMDAT

; 95   : 	return m_pUnitInfo->GetText();

	mov	eax, DWORD PTR _this$[esp-4]
	mov	ecx, DWORD PTR [eax+8]
	call	?GetText@CvBaseInfo@@QBEPBDXZ		; CvBaseInfo::GetText

; 96   : }

	ret	4
?GetText@CvDllUnitInfo@@UBGPBDXZ ENDP			; CvDllUnitInfo::GetText
_TEXT	ENDS
EXTRN	?GetMoveRate@CvUnitEntry@@QBE?AUUnitMoveRate@@H@Z:PROC ; CvUnitEntry::GetMoveRate
; Function compile flags: /Ogtpy
;	COMDAT ?GetMoveRate@CvDllUnitInfo@@UBG?AUUnitMoveRate@@H@Z
_TEXT	SEGMENT
_this$ = 8						; size = 4
___$ReturnUdt$ = 12					; size = 4
_numHexes$ = 16						; size = 4
?GetMoveRate@CvDllUnitInfo@@UBG?AUUnitMoveRate@@H@Z PROC ; CvDllUnitInfo::GetMoveRate, COMDAT

; 100  : 	return m_pUnitInfo->GetMoveRate(numHexes);

	mov	eax, DWORD PTR _numHexes$[esp-4]
	mov	ecx, DWORD PTR _this$[esp-4]
	mov	ecx, DWORD PTR [ecx+8]
	push	esi
	mov	esi, DWORD PTR ___$ReturnUdt$[esp]
	push	eax
	push	esi
	call	?GetMoveRate@CvUnitEntry@@QBE?AUUnitMoveRate@@H@Z ; CvUnitEntry::GetMoveRate
	mov	eax, esi
	pop	esi

; 101  : }

	ret	12					; 0000000cH
?GetMoveRate@CvDllUnitInfo@@UBG?AUUnitMoveRate@@H@Z ENDP ; CvDllUnitInfo::GetMoveRate
_TEXT	ENDS
EXTRN	?GetUnitArtInfoTag@CvUnitEntry@@QBEPBDXZ:PROC	; CvUnitEntry::GetUnitArtInfoTag
; Function compile flags: /Ogtpy
;	COMDAT ?GetUnitArtInfoTag@CvDllUnitInfo@@UBGPBDXZ
_TEXT	SEGMENT
_this$ = 8						; size = 4
?GetUnitArtInfoTag@CvDllUnitInfo@@UBGPBDXZ PROC		; CvDllUnitInfo::GetUnitArtInfoTag, COMDAT

; 105  : 	return m_pUnitInfo->GetUnitArtInfoTag();

	mov	eax, DWORD PTR _this$[esp-4]
	mov	ecx, DWORD PTR [eax+8]
	call	?GetUnitArtInfoTag@CvUnitEntry@@QBEPBDXZ ; CvUnitEntry::GetUnitArtInfoTag

; 106  : }

	ret	4
?GetUnitArtInfoTag@CvDllUnitInfo@@UBGPBDXZ ENDP		; CvDllUnitInfo::GetUnitArtInfoTag
_TEXT	ENDS
EXTRN	?GetUnitArtInfoCulturalVariation@CvUnitEntry@@QBE?B_NXZ:PROC ; CvUnitEntry::GetUnitArtInfoCulturalVariation
; Function compile flags: /Ogtpy
;	COMDAT ?GetUnitArtInfoCulturalVariation@CvDllUnitInfo@@UBG_NXZ
_TEXT	SEGMENT
_this$ = 8						; size = 4
?GetUnitArtInfoCulturalVariation@CvDllUnitInfo@@UBG_NXZ PROC ; CvDllUnitInfo::GetUnitArtInfoCulturalVariation, COMDAT

; 110  : 	return m_pUnitInfo->GetUnitArtInfoCulturalVariation();

	mov	eax, DWORD PTR _this$[esp-4]
	mov	ecx, DWORD PTR [eax+8]
	call	?GetUnitArtInfoCulturalVariation@CvUnitEntry@@QBE?B_NXZ ; CvUnitEntry::GetUnitArtInfoCulturalVariation

; 111  : }

	ret	4
?GetUnitArtInfoCulturalVariation@CvDllUnitInfo@@UBG_NXZ ENDP ; CvDllUnitInfo::GetUnitArtInfoCulturalVariation
_TEXT	ENDS
EXTRN	?GetUnitArtInfoEraVariation@CvUnitEntry@@QBE?B_NXZ:PROC ; CvUnitEntry::GetUnitArtInfoEraVariation
; Function compile flags: /Ogtpy
;	COMDAT ?GetUnitArtInfoEraVariation@CvDllUnitInfo@@UBG_NXZ
_TEXT	SEGMENT
_this$ = 8						; size = 4
?GetUnitArtInfoEraVariation@CvDllUnitInfo@@UBG_NXZ PROC	; CvDllUnitInfo::GetUnitArtInfoEraVariation, COMDAT

; 115  : 	return m_pUnitInfo->GetUnitArtInfoEraVariation();

	mov	eax, DWORD PTR _this$[esp-4]
	mov	ecx, DWORD PTR [eax+8]
	call	?GetUnitArtInfoEraVariation@CvUnitEntry@@QBE?B_NXZ ; CvUnitEntry::GetUnitArtInfoEraVariation

; 116  : }

	ret	4
?GetUnitArtInfoEraVariation@CvDllUnitInfo@@UBG_NXZ ENDP	; CvDllUnitInfo::GetUnitArtInfoEraVariation
_TEXT	ENDS
EXTRN	?GetUnitFlagIconOffset@CvUnitEntry@@QBEHXZ:PROC	; CvUnitEntry::GetUnitFlagIconOffset
; Function compile flags: /Ogtpy
;	COMDAT ?GetUnitFlagIconOffset@CvDllUnitInfo@@UBGHXZ
_TEXT	SEGMENT
_this$ = 8						; size = 4
?GetUnitFlagIconOffset@CvDllUnitInfo@@UBGHXZ PROC	; CvDllUnitInfo::GetUnitFlagIconOffset, COMDAT

; 120  : 	return m_pUnitInfo->GetUnitFlagIconOffset();

	mov	eax, DWORD PTR _this$[esp-4]
	mov	ecx, DWORD PTR [eax+8]
	call	?GetUnitFlagIconOffset@CvUnitEntry@@QBEHXZ ; CvUnitEntry::GetUnitFlagIconOffset

; 121  : }

	ret	4
?GetUnitFlagIconOffset@CvDllUnitInfo@@UBGHXZ ENDP	; CvDllUnitInfo::GetUnitFlagIconOffset
_TEXT	ENDS
PUBLIC	_IsEqualGUID
; Function compile flags: /Ogtpy
; File c:\program files\microsoft sdks\windows\v6.0a\include\guiddef.h
;	COMDAT _IsEqualGUID
_TEXT	SEGMENT
_rguid1$ = 8						; size = 4
_rguid2$ = 12						; size = 4
_IsEqualGUID PROC					; COMDAT

; 161  :     return !memcmp(&rguid1, &rguid2, sizeof(GUID));

	mov	ecx, DWORD PTR _rguid2$[esp-4]
	mov	edx, DWORD PTR _rguid1$[esp-4]
	mov	eax, 16					; 00000010H
	push	esi
	npad	2
$LL4@IsEqualGUI:
	mov	esi, DWORD PTR [edx]
	cmp	esi, DWORD PTR [ecx]
	jne	SHORT $LN5@IsEqualGUI
	sub	eax, 4
	add	ecx, 4
	add	edx, 4
	cmp	eax, 4
	jae	SHORT $LL4@IsEqualGUI
	xor	eax, eax
	xor	edx, edx
	test	eax, eax
	sete	dl
	pop	esi
	mov	eax, edx

; 162  : }

	ret	0
$LN5@IsEqualGUI:

; 161  :     return !memcmp(&rguid1, &rguid2, sizeof(GUID));

	movzx	eax, BYTE PTR [edx]
	movzx	esi, BYTE PTR [ecx]
	sub	eax, esi
	jne	SHORT $LN7@IsEqualGUI
	movzx	eax, BYTE PTR [edx+1]
	movzx	esi, BYTE PTR [ecx+1]
	sub	eax, esi
	jne	SHORT $LN7@IsEqualGUI
	movzx	eax, BYTE PTR [edx+2]
	movzx	esi, BYTE PTR [ecx+2]
	sub	eax, esi
	jne	SHORT $LN7@IsEqualGUI
	movzx	eax, BYTE PTR [edx+3]
	movzx	ecx, BYTE PTR [ecx+3]
	sub	eax, ecx
$LN7@IsEqualGUI:
	sar	eax, 31					; 0000001fH
	or	eax, 1
	xor	edx, edx
	test	eax, eax
	sete	dl
	pop	esi
	mov	eax, edx

; 162  : }

	ret	0
_IsEqualGUID ENDP
_TEXT	ENDS
PUBLIC	_==
; Function compile flags: /Ogtpy
;	COMDAT _==
_TEXT	SEGMENT
_guidOne$ = 8						; size = 4
_guidOther$ = 12					; size = 4
_==	PROC						; COMDAT

; 194  :     return IsEqualGUID(guidOne,guidOther);

	jmp	_IsEqualGUID
_==	ENDP
_TEXT	ENDS
PUBLIC	?GetInterfaceId@ICvUnknown@@SG?AU_GUID@@XZ	; ICvUnknown::GetInterfaceId
; Function compile flags: /Ogtpy
; File c:\users\enormousapplepie\desktop\lekmod dll versions\v31\lekmod_dll\cvgamecoredllutil\include\cvdllinterfaces.h
;	COMDAT ?GetInterfaceId@ICvUnknown@@SG?AU_GUID@@XZ
_TEXT	SEGMENT
$T218532 = 8						; size = 4
?GetInterfaceId@ICvUnknown@@SG?AU_GUID@@XZ PROC		; ICvUnknown::GetInterfaceId, COMDAT

; 306  : 	static GUID DLLCALL GetInterfaceId(){ return guidICvUnknown; }

	mov	eax, DWORD PTR $T218532[esp-4]
	mov	ecx, DWORD PTR _guidICvUnknown
	mov	edx, DWORD PTR _guidICvUnknown+4
	mov	DWORD PTR [eax], ecx
	mov	ecx, DWORD PTR _guidICvUnknown+8
	mov	DWORD PTR [eax+4], edx
	mov	edx, DWORD PTR _guidICvUnknown+12
	mov	DWORD PTR [eax+8], ecx
	mov	DWORD PTR [eax+12], edx
	ret	4
?GetInterfaceId@ICvUnknown@@SG?AU_GUID@@XZ ENDP		; ICvUnknown::GetInterfaceId
_TEXT	ENDS
PUBLIC	?GetInterfaceId@ICvUnitInfo1@@SG?AU_GUID@@XZ	; ICvUnitInfo1::GetInterfaceId
; Function compile flags: /Ogtpy
;	COMDAT ?GetInterfaceId@ICvUnitInfo1@@SG?AU_GUID@@XZ
_TEXT	SEGMENT
$T218536 = 8						; size = 4
?GetInterfaceId@ICvUnitInfo1@@SG?AU_GUID@@XZ PROC	; ICvUnitInfo1::GetInterfaceId, COMDAT

; 1784 : 	static GUID DLLCALL GetInterfaceId() { return guidICvUnitInfo1; }

	mov	eax, DWORD PTR $T218536[esp-4]
	mov	ecx, DWORD PTR _guidICvUnitInfo1
	mov	edx, DWORD PTR _guidICvUnitInfo1+4
	mov	DWORD PTR [eax], ecx
	mov	ecx, DWORD PTR _guidICvUnitInfo1+8
	mov	DWORD PTR [eax+4], edx
	mov	edx, DWORD PTR _guidICvUnitInfo1+12
	mov	DWORD PTR [eax+8], ecx
	mov	DWORD PTR [eax+12], edx
	ret	4
?GetInterfaceId@ICvUnitInfo1@@SG?AU_GUID@@XZ ENDP	; ICvUnitInfo1::GetInterfaceId
_TEXT	ENDS
PUBLIC	?GetType@CvBaseInfo@@QBEPBDXZ			; CvBaseInfo::GetType
EXTRN	__imp_?c_str@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QBEPBDXZ:PROC
; Function compile flags: /Ogtpy
; File c:\users\enormousapplepie\desktop\lekmod dll versions\v31\lekmod_dll\cvgamecoredll_expansion2\cvinfos.h
;	COMDAT ?GetType@CvBaseInfo@@QBEPBDXZ
_TEXT	SEGMENT
?GetType@CvBaseInfo@@QBEPBDXZ PROC			; CvBaseInfo::GetType, COMDAT
; _this$ = ecx

; 92   : 		return m_strType.c_str();

	add	ecx, 176				; 000000b0H
	jmp	DWORD PTR __imp_?c_str@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QBEPBDXZ
?GetType@CvBaseInfo@@QBEPBDXZ ENDP			; CvBaseInfo::GetType
_TEXT	ENDS
PUBLIC	??_7ICvUnitInfo1@@6B@				; ICvUnitInfo1::`vftable'
PUBLIC	??0ICvUnitInfo1@@QAE@XZ				; ICvUnitInfo1::ICvUnitInfo1
PUBLIC	??_R4ICvUnitInfo1@@6B@				; ICvUnitInfo1::`RTTI Complete Object Locator'
;	COMDAT ??_R4ICvUnitInfo1@@6B@
rdata$r	SEGMENT
??_R4ICvUnitInfo1@@6B@ DD 00H				; ICvUnitInfo1::`RTTI Complete Object Locator'
	DD	00H
	DD	00H
	DD	FLAT:??_R0?AVICvUnitInfo1@@@8
	DD	FLAT:??_R3ICvUnitInfo1@@8
rdata$r	ENDS
;	COMDAT ??_7ICvUnitInfo1@@6B@
CONST	SEGMENT
??_7ICvUnitInfo1@@6B@ DD FLAT:??_R4ICvUnitInfo1@@6B@	; ICvUnitInfo1::`vftable'
	DD	FLAT:__purecall
	DD	FLAT:__purecall
	DD	FLAT:__purecall
	DD	FLAT:__purecall
	DD	FLAT:__purecall
	DD	FLAT:__purecall
	DD	FLAT:__purecall
	DD	FLAT:__purecall
	DD	FLAT:__purecall
	DD	FLAT:__purecall
	DD	FLAT:__purecall
; Function compile flags: /Ogtpy
CONST	ENDS
;	COMDAT ??0ICvUnitInfo1@@QAE@XZ
_TEXT	SEGMENT
??0ICvUnitInfo1@@QAE@XZ PROC				; ICvUnitInfo1::ICvUnitInfo1, COMDAT
; _this$ = ecx
	mov	eax, ecx
	mov	DWORD PTR [eax], OFFSET ??_7ICvUnitInfo1@@6B@
	ret	0
??0ICvUnitInfo1@@QAE@XZ ENDP				; ICvUnitInfo1::ICvUnitInfo1
; Function compile flags: /Ogtpy
; File c:\users\enormousapplepie\desktop\lekmod dll versions\v31\lekmod_dll\cvgamecoredll_expansion2\cvdllunitinfo.cpp
_TEXT	ENDS
;	COMDAT ?QueryInterface@CvDllUnitInfo@@UAGPAXU_GUID@@@Z
_TEXT	SEGMENT
$T218552 = -16						; size = 16
$T218550 = -16						; size = 16
_this$ = 8						; size = 4
_guidInterface$ = 12					; size = 16
?QueryInterface@CvDllUnitInfo@@UAGPAXU_GUID@@@Z PROC	; CvDllUnitInfo::QueryInterface, COMDAT

; 27   : {

	sub	esp, 16					; 00000010H

; 28   : 	if(guidInterface == ICvUnknown::GetInterfaceId() ||
; 29   : 	        guidInterface == ICvUnitInfo1::GetInterfaceId())

	mov	ecx, DWORD PTR _guidICvUnknown+4
	mov	edx, DWORD PTR _guidICvUnknown+8
	mov	eax, DWORD PTR _guidICvUnknown
	mov	DWORD PTR $T218550[esp+20], ecx
	lea	ecx, DWORD PTR $T218550[esp+16]
	mov	DWORD PTR $T218550[esp+24], edx
	mov	DWORD PTR $T218550[esp+16], eax
	mov	eax, DWORD PTR _guidICvUnknown+12
	push	ecx
	lea	edx, DWORD PTR _guidInterface$[esp+16]
	push	edx
	mov	DWORD PTR $T218550[esp+36], eax
	call	_IsEqualGUID
	add	esp, 8
	test	eax, eax
	jne	SHORT $LN1@QueryInter
	mov	ecx, DWORD PTR _guidICvUnitInfo1+4
	mov	edx, DWORD PTR _guidICvUnitInfo1+8
	mov	eax, DWORD PTR _guidICvUnitInfo1
	mov	DWORD PTR $T218552[esp+20], ecx
	lea	ecx, DWORD PTR $T218552[esp+16]
	mov	DWORD PTR $T218552[esp+24], edx
	mov	DWORD PTR $T218552[esp+16], eax
	mov	eax, DWORD PTR _guidICvUnitInfo1+12
	push	ecx
	lea	edx, DWORD PTR _guidInterface$[esp+16]
	push	edx
	mov	DWORD PTR $T218552[esp+36], eax
	call	_IsEqualGUID
	add	esp, 8
	test	eax, eax
	jne	SHORT $LN1@QueryInter

; 32   : 		return this;
; 33   : 	}
; 34   : 
; 35   : 	return NULL;
; 36   : }

	add	esp, 16					; 00000010H
	ret	20					; 00000014H
$LN1@QueryInter:

; 30   : 	{
; 31   : 		IncrementReference();

	mov	eax, DWORD PTR _this$[esp+12]
	inc	DWORD PTR [eax+4]

; 32   : 		return this;
; 33   : 	}
; 34   : 
; 35   : 	return NULL;
; 36   : }

	add	esp, 16					; 00000010H
	ret	20					; 00000014H
?QueryInterface@CvDllUnitInfo@@UAGPAXU_GUID@@@Z ENDP	; CvDllUnitInfo::QueryInterface
_TEXT	ENDS
PUBLIC	??_GCvDllUnitInfo@@QAEPAXI@Z			; CvDllUnitInfo::`scalar deleting destructor'
; Function compile flags: /Ogtpy
;	COMDAT ??_GCvDllUnitInfo@@QAEPAXI@Z
_TEXT	SEGMENT
___flags$ = 8						; size = 4
??_GCvDllUnitInfo@@QAEPAXI@Z PROC			; CvDllUnitInfo::`scalar deleting destructor', COMDAT
; _this$ = ecx
	test	BYTE PTR ___flags$[esp-4], 1
	push	esi
	mov	esi, ecx
	mov	DWORD PTR [esi], OFFSET ??_7CvDllUnitInfo@@6B@
	je	SHORT $LN8@scalar
	push	esi
	call	?Free@CvDllGameContext@@SAXPAX@Z	; CvDllGameContext::Free
	add	esp, 4
$LN8@scalar:
	mov	eax, esi
	pop	esi
	ret	4
??_GCvDllUnitInfo@@QAEPAXI@Z ENDP			; CvDllUnitInfo::`scalar deleting destructor'
; Function compile flags: /Ogtpy
_TEXT	ENDS
;	COMDAT ?GetType@CvDllUnitInfo@@UBGPBDXZ
_TEXT	SEGMENT
_this$ = 8						; size = 4
?GetType@CvDllUnitInfo@@UBGPBDXZ PROC			; CvDllUnitInfo::GetType, COMDAT

; 90   : 	return m_pUnitInfo->GetType();

	mov	eax, DWORD PTR _this$[esp-4]
	mov	eax, DWORD PTR [eax+8]
	lea	ecx, DWORD PTR [eax+176]
	call	DWORD PTR __imp_?c_str@?$basic_string@DU?$char_traits@D@std@@V?$allocator@D@2@@std@@QBEPBDXZ

; 91   : }

	ret	4
?GetType@CvDllUnitInfo@@UBGPBDXZ ENDP			; CvDllUnitInfo::GetType
_TEXT	ENDS
PUBLIC	??0CvDllUnitInfo@@QAE@PAVCvUnitEntry@@@Z	; CvDllUnitInfo::CvDllUnitInfo
; Function compile flags: /Ogtpy
;	COMDAT ??0CvDllUnitInfo@@QAE@PAVCvUnitEntry@@@Z
_TEXT	SEGMENT
_pUnitInfo$ = 8						; size = 4
??0CvDllUnitInfo@@QAE@PAVCvUnitEntry@@@Z PROC		; CvDllUnitInfo::CvDllUnitInfo, COMDAT
; _this$ = ecx

; 19   : {

	mov	eax, ecx
	mov	ecx, DWORD PTR _pUnitInfo$[esp-4]
	mov	DWORD PTR [eax], OFFSET ??_7CvDllUnitInfo@@6B@
	mov	DWORD PTR [eax+4], 1
	mov	DWORD PTR [eax+8], ecx

; 20   : }

	ret	4
??0CvDllUnitInfo@@QAE@PAVCvUnitEntry@@@Z ENDP		; CvDllUnitInfo::CvDllUnitInfo
_TEXT	ENDS
PUBLIC	?DecrementReference@CvDllUnitInfo@@QAEIXZ	; CvDllUnitInfo::DecrementReference
; Function compile flags: /Ogtpy
;	COMDAT ?DecrementReference@CvDllUnitInfo@@QAEIXZ
_TEXT	SEGMENT
?DecrementReference@CvDllUnitInfo@@QAEIXZ PROC		; CvDllUnitInfo::DecrementReference, COMDAT
; _this$ = ecx

; 46   : 	if(m_uiRefCount == 1)

	mov	eax, DWORD PTR [ecx+4]
	cmp	eax, 1
	jne	SHORT $LN2@DecrementR

; 47   : 	{
; 48   : 		delete this;

	push	ecx
	mov	DWORD PTR [ecx], OFFSET ??_7CvDllUnitInfo@@6B@
	call	?Free@CvDllGameContext@@SAXPAX@Z	; CvDllGameContext::Free
	add	esp, 4

; 49   : 		return 0;

	xor	eax, eax

; 54   : 		return m_uiRefCount;
; 55   : 	}
; 56   : }

	ret	0
$LN2@DecrementR:

; 50   : 	}
; 51   : 	else
; 52   : 	{
; 53   : 		--m_uiRefCount;

	dec	eax
	mov	DWORD PTR [ecx+4], eax

; 54   : 		return m_uiRefCount;
; 55   : 	}
; 56   : }

	ret	0
?DecrementReference@CvDllUnitInfo@@QAEIXZ ENDP		; CvDllUnitInfo::DecrementReference
; Function compile flags: /Ogtpy
_TEXT	ENDS
;	COMDAT ?Destroy@CvDllUnitInfo@@EAGXXZ
_TEXT	SEGMENT
_this$ = 8						; size = 4
?Destroy@CvDllUnitInfo@@EAGXXZ PROC			; CvDllUnitInfo::Destroy, COMDAT

; 65   : 	DecrementReference();

	mov	eax, DWORD PTR _this$[esp-4]
	mov	ecx, DWORD PTR [eax+4]
	cmp	ecx, 1
	jne	SHORT $LN4@Destroy
	push	eax
	mov	DWORD PTR [eax], OFFSET ??_7CvDllUnitInfo@@6B@
	call	?Free@CvDllGameContext@@SAXPAX@Z	; CvDllGameContext::Free
	add	esp, 4

; 66   : }

	ret	4

; 65   : 	DecrementReference();

$LN4@Destroy:
	dec	ecx
	mov	DWORD PTR [eax+4], ecx

; 66   : }

	ret	4
?Destroy@CvDllUnitInfo@@EAGXXZ ENDP			; CvDllUnitInfo::Destroy
_TEXT	ENDS
END