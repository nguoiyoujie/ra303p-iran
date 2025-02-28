;----------------------------------------------------------------
; src/features/type_extensions/HouseClass/houseclass_new_types.asm
;
; Allocate new HouseClass. More precisely, modify existing code to include an expanded set of houses, because many of them are hardcoded.
; 
; This function is not configurable.
; 
; No compatibility issues is expected as the original game lack the ability to add new types.
;
;----------------------------------------------------------------

; moving Globals::HouseTriggers[x] to Houses.HouseTriggers
@HOOK 0x004C7966 _Replace_HouseTriggers_4C7966 ; wish I can simply patch over the address
@HOOK 0x004D3C12 _Replace_HouseTriggers_4D3C12 ; HouseClass::HouseClass
@HOOK 0x004D4113 _Replace_HouseTriggers_4D4113 ; HouseClass::Init
@HOOK 0x004D4CDE _Replace_HouseTriggers_4D4CDE ; HouseClass::AI
@HOOK 0x004D4D16 _Replace_HouseTriggers_4D4D16 ; HouseClass::AI
@HOOK 0x004D5D33 _Replace_HouseTriggers_4D5D33 ; HouseClass::Attacked
@HOOK 0x004D5D74 _Replace_HouseTriggers_4D5D74 ; HouseClass::Attacked
@HOOK 0x004D7E0E _Replace_HouseTriggers_4D7E0E ; HouseClass::Detach
@HOOK 0x00537880 _Replace_HouseTriggers_537880 ; Put_All
@HOOK 0x005378E3 _Replace_HouseTriggers_5378E3 ; Put_All
@HOOK 0x0053855D _Replace_HouseTriggers_53855D ; Put_All
@HOOK 0x0053A745 _Replace_HouseTriggers_53A745 ; Fill_in_Data
@HOOK 0x0053AB84 _Replace_HouseTriggers_53AB84 ; Clear_Scenario

_Replace_HouseTriggers_4C7966:
    mov dword[0x005F99C0],Houses.HouseTriggers ; ugly hack to appease the deconstructor~
    mov eax,Houses.HouseTriggers
    ;mov dword[edx+8],ecx
    ;mov eax,0x0067F074
    ;mov edx,0x14
    ;mov edi,0x2a
    ;call 0x005BCCF4
    ;mov dword[0x005F99C0],Houses.HouseTriggers
    ;mov ebx,0x005F9274
    ;mov eax,Houses.HouseTriggers
    ;mov edx,HouseTypeClass.NEW_COUNT
    ;mov edi,0x2a
    jmp 0x004C796B ; 0x004C7978

_Replace_HouseTriggers_4D3C12:
    add eax,Houses.HouseTriggers
    jmp 0x004D3C17

_Replace_HouseTriggers_4D4113:
    add eax,Houses.HouseTriggers
    jmp 0x004D4118

_Replace_HouseTriggers_4D4CDE:
    add eax,Houses.HouseTriggers
    jmp 0x004D4CE3

_Replace_HouseTriggers_4D4D16:
    add eax,Houses.HouseTriggers
    jmp 0x004D4D1B

_Replace_HouseTriggers_4D5D33:
    add eax,Houses.HouseTriggers
    jmp 0x004D5D38

_Replace_HouseTriggers_4D5D74:
    add eax,Houses.HouseTriggers
    jmp 0x004D5D79

_Replace_HouseTriggers_4D7E0E:
    add eax,Houses.HouseTriggers
    jmp 0x004D7E13

_Replace_HouseTriggers_537880:
    add eax,Houses.HouseTriggers
    jmp 0x00537885

_Replace_HouseTriggers_5378E3:
    add eax,Houses.HouseTriggers
    jmp 0x005378E8

_Replace_HouseTriggers_53855D:
    mov edi,Houses.HouseTriggers
    jmp 0x00538562

_Replace_HouseTriggers_53A745:
    add eax,Houses.HouseTriggers
    jmp 0x0053A74A

_Replace_HouseTriggers_53AB84:
    add eax,Houses.HouseTriggers
    jmp 0x0053AB89

; @SETB accepts only constants, not HouseTypeClass.NEW_COUNT

; TO-DO: check FlasherClass::FlashCountPerPlayer[HOUSE_COUNT] as well, it is possible FlashCountPerPlayer only exists in Remastered code
@SETB 0x004C796F HouseTypeClass.NEW_COUNT ; init
@SETB 0x004F77B0 HouseTypeClass.NEW_COUNT_PLUS_ONE ; static void Init_Heaps(void)
@SETB 0x004633A5 HouseTypeClass.NEW_COUNT ; CCINIClass::Put_Owners, was 0x14
@SETB 0x004A0298 HouseTypeClass.NEW_COUNT ;void CellClass::Adjust_Threat(HousesType house, int threat_value), was 0x14
;@SETB 0x004AB65E 0x19 ; Conquer::Owner_From_Name, was 0x13; hooked by features/coop.asm
;@SETB ??? HouseTypeClass.NEW_COUNT ??? ; Conquer::Shake_The_Screen, seems to exist only in Remastered
@SETB 0x004CD0FE HouseTypeClass.NEW_COUNT ; HouseTypeClass::From_Name, was 0x14
@SETB 0x004D4128 HouseTypeClass.NEW_COUNT ; void HouseClass::Init(void), was 0x14
@SETB 0x004D7E73 HouseTypeClass.NEW_COUNT ; bool HouseClass::Does_Enemy_Building_Exist(StructType btype), was 0x14
@SETB 0x004D866B HouseTypeClass.NEW_COUNT ; void HouseClass::Tally_Score(void), was 0x14
@SETB 0x004D880A HouseTypeClass.NEW_COUNT ; void HouseClass::Tally_Score(void), was 0x14
@SETB 0x004D9814 HouseTypeClass.NEW_COUNT ; int HouseClass::Expert_AI(void), was 0x14
@SETB 0x004DA334 HouseTypeClass.NEW_COUNT ; int HouseClass::AI_Building(void), was 0x14
@SETB 0x004DB0EE HouseTypeClass.NEW_COUNT ; int HouseClass::AI_Building(void), was 0x14
@SETB 0x004DDE8F HouseTypeClass.NEW_COUNT ; void HouseClass::Read_INI(CCINIClass & ini), was 0x14
@SETB 0x004DDE9C HouseTypeClass.NEW_COUNT ; void HouseClass::Read_INI(CCINIClass & ini), was 0x14
@SETB 0x004DDEF4 HouseTypeClass.NEW_COUNT ; void HouseClass::Write_INI(CCINIClass & ini), was 0x14
@SETB 0x004DE61E HouseTypeClass.NEW_COUNT ; bool HouseClass::Is_Allowed_To_Ally(HousesType house) const, was 0x14
@SETB 0x004DE688 HouseTypeClass.NEW_COUNT ; void HouseClass::Computer_Paranoid(void)
@SETB 0x004DE6E2 HouseTypeClass.NEW_COUNT ; void HouseClass::Computer_Paranoid(void)
@SETB 0x004FE1F4 HouseTypeClass.NEW_COUNT ; void LogicClass::AI(void), was 0x14
@SETB 0x004FE220 HouseTypeClass.NEW_COUNT ; void LogicClass::AI(void), was 0x14
@SETB 0x004FFECE HouseTypeClass.NEW_COUNT ; bool MapClass::Base_Region(CELL cell, HousesType & house, ZoneType & zone), was 0x14
@SETB 0x005321C3 HouseTypeClass.NEW_COUNT ; bool RadarClass::Spy_Next_House(void)
;@SETB 0x00532859 HouseTypeClass.NEW_COUNT ; void RadarClass::Draw_Names(void) ; extend UnitsKilled / BuildingsKilled first
@SETB 0x00537522 HouseTypeClass.NEW_COUNT ; bool RulesClass::Objects(CCINIClass & ini)
@SETB 0x005378AE HouseTypeClass.NEW_COUNT ; static void Put_All(Pipe & pipe, int save_net)
@SETB 0x00538556 HouseTypeClass.NEW_COUNT ; bool Load_Game(const char *file_name)
@SETB 0x0053AA2F HouseTypeClass.NEW_COUNT ; void Fill_In_Data(void)
@SETB 0x0053AB99 HouseTypeClass.NEW_COUNT ; void Clear_Scenario(void)

@HOOK 0x004D38FA _HouseClass__HouseClass_Reset_NewData
@HOOK 0x004D8CAE _HouseClass__Init_Data_Reset_NewData ; for multiplayer, might not be necessary due to above hook to constructor

_HouseClass__HouseClass_Reset_NewData:
; edx is the house
    mov  edi,dword[eax-0x1781]
    push eax
    HouseClass.SecondaryColorScheme.Set(edx,0xFF) 
    HouseClass.InstantCapture.Set(edx,0) 
    HouseClass.NoBuildingCrew.Set(edx,0) 
    HouseClass.AllyTheNeutralHouse.Set(edx,0) 

    push edi
    mov  eax,dword[edx+HouseClass.Offset.ID]
    HouseTypeClass.FromIndex(eax,edi)
    HouseTypeClass.HeliUnit.Get(edi,al)
    HouseClass.HeliUnit.Set(edx,al)
    HouseTypeClass.MCVUnit.Get(edi,al)
    HouseClass.MCVUnit.Set(edx,al)

    pop  edi
    pop  eax
    jmp  0x004D3900


_HouseClass__Init_Data_Reset_NewData: ; for multiplayer
; esi is the house
; bl is the actlike housetype
; trnasfer data
; Warning: this works only if you do not populate Multi1-8 houses with singleplayer data

    cmp  dword [InCoopMode],1
    jz   .Next
    mov  dword[eax+0x197],ecx ; Credits
.Next:
    push eax
    push edi
    push esi
    push ebx
    mov  esi,edi
    movzx ebx,bl
    HouseClass.FromIndex(ebx,edi)
    HouseClass.SecondaryColorScheme.Get(edi,bl) 
    HouseClass.SecondaryColorScheme.Set(esi,bl) 
    HouseClass.InstantCapture.Get(edi,bl) 
    HouseClass.InstantCapture.Set(esi,bl) 
    HouseClass.NoBuildingCrew.Get(edi,bl)
    HouseClass.NoBuildingCrew.Set(esi,bl) 
    HouseClass.AllyTheNeutralHouse.Get(edi,bl) 
    HouseClass.AllyTheNeutralHouse.Set(esi,bl) 
    pop  ebx
    push ebx
    movzx ebx,bl
    HouseTypeClass.FromIndex(ebx,edi)    
    HouseTypeClass.HeliUnit.Get(edi,bl) 
    HouseClass.HeliUnit.Set(esi,bl) 
    HouseTypeClass.MCVUnit.Get(edi,bl) 
    HouseClass.MCVUnit.Set(esi,bl) 
    pop  ebx
    pop  esi
    pop  edi
    pop  eax
    jmp  0x004D8CB4

