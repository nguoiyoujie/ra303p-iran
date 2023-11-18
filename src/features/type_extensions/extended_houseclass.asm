@HOOK 0x004C7175 _TFixedHeapClass_fn_init_HouseClass
@HOOK 0x004C8365 _TFixedHeapClass__HouseClass__Constructor_HouseClass
@HOOK 0x004DDD1D _HouseClass__Read_INI_HouseClass
@HOOK 0x004CED13 _TFixedHeapClass__HouseClass__Save_HouseClass
@HOOK 0x004CEDF5 _TFixedHeapClass__HouseClass__Load_HouseClass
@HOOK 0x004CEE10 _TFixedHeapClass__HouseClass__Load_Clear_Memory_For_Old_Savegames
@HOOK 0x004DDD31 _HouseClass__Read_INI
@HOOK 0x00540F20 _ScoreClass__Presentation_Proper_Country_Check
@HOOK 0x004DDE56 _HouseClass__Read_INI_Optional_House_Neutral_Ally
@HOOK 0x004DDE80 _HouseClass__Read_INI_Optional_House_Neutral_Ally_Patch_Out_Double


allyneutral db 1

%define    EXT_Resigned                0x17BC
%define    EXT_ConnectionLost            0x17B8
%define EXT_SpawnLocation            0x17B4
%define EXT_IsSpectator                0x17B0
%define EXT_SecondaryColorScheme    0x1802
; Use offset +0x1800 for bool BuildingsGetInstantlyCpatured
; Use offset +0x1801 for bool NoBuildingCrew
; Use offset +0x1802 for byte SecondaryColorScheme
; Use Offset +0x1803 to +0x1873 for infantry left
; Use Offset +0x1873 to +0x18E3 for tanks left
; Use Offset +0x1903 to +0x1973 for planes left
; Use Offset +0x1973 to +0x19E3 for vessels left
; Use Offset +0x1A00 to +0x1B60 for buildings left

_TFixedHeapClass__HouseClass__Load_Clear_Memory_For_Old_Savegames:
    Clear_Extended_Class_Memory_For_Old_Saves esi,HouseClass.NEW_SIZE,HouseClass.ORIGINAL_SIZE

    mov  byte [esi+EXT_SecondaryColorScheme],0xFF

.Ret:
    mov  ebx,0x005F6538
    jmp  0x004CEE15

_TFixedHeapClass_fn_init_HouseClass:
    mov  edx,HouseClass.NEW_SIZE
    jmp  0x004C717A

_TFixedHeapClass__HouseClass__Constructor_HouseClass:
    mov  edx,HouseClass.NEW_SIZE
    jmp  0x004C836A

_HouseClass__Read_INI_HouseClass:
    mov  edx,HouseClass.NEW_SIZE
    jmp  0x004DDD22

_TFixedHeapClass__HouseClass__Save_HouseClass:
    mov  ebx,HouseClass.NEW_SIZE
    jmp  0x004CED18

_TFixedHeapClass__HouseClass__Load_HouseClass:
    cmp  dword [SaveGameVersion],New_Savegame_Version
    jnz  .Old_Savegame

    mov  ebx,HouseClass.NEW_SIZE
    jmp  0x004CEDFA

.Old_Savegame:
    mov  ebx,HouseClass.ORIGINAL_SIZE
    jmp  0x004CEDFA

_HouseClass__Read_INI_Optional_House_Neutral_Ally_Patch_Out_Double:
    cmp  edx,0x0A ; Neutral house
    jz   .Ret

    call HouseClass__Make_Ally

.Ret:
    jmp  0x004DDE85

_HouseClass__Read_INI_Optional_House_Neutral_Ally:
    mov  edx,0Ah
    mov  eax,esi

    cmp  byte [allyneutral],0
    jz   .Ret

    call HouseClass__Make_Ally

.Ret:
    mov  byte [allyneutral],1
    jmp  0x004DDE62

_ScoreClass__Presentation_Proper_Country_Check:

    mov  byte dl,[eax+0x41]
    mov  edi,eax
    jmp  0x00540F25

_HouseClass__Read_INI:
    call 0x004D33E4 ; HouseClass::HouseClass(HousesType)
    mov  [ebp-0x24],eax

    Save_Registers

    mov  esi,[ebp-0x24] ; HouseClass_This

    mov  ecx,0xFF   ; default
    mov  edx,edi    ; section
    mov  dword eax,[ebp-20h] ; scenario INI
    mov  ebx,str_Colour  ; key
    call INIClass__Get_Int

    cmp  byte al,0xFF
    jz   .No_Custom_Colour

    mov  [esi+0x178F],al

.No_Custom_Colour:

    Restore_Registers

    Save_Registers

    mov  esi,[ebp-0x24] ; HouseClass_This

    mov  ecx,0xFF   ; default
    mov  edx,edi    ; section
    mov  dword eax,[ebp-20h] ; scenario INI
    mov  ebx,str_Color  ; key
    call INIClass__Get_Int

    cmp  byte al,0xFF
    jz   .No_Custom_Color

    mov  [esi+0x178F],al

.No_Custom_Color:

    Restore_Registers

    Save_Registers

    mov  esi,[ebp-0x24] ; HouseClass_This

    mov  ecx,0xFF   ; default
    mov  edx,edi    ; section
    mov  dword eax,[ebp-20h] ; scenario INI
    mov  ebx,str_Country ; key
    call INIClass__Get_Int

    cmp  byte al,0xFF
    jz   .No_Custom_Country

    mov  [esi+0x41],al


.No_Custom_Country:

    Restore_Registers

    Save_Registers

    mov  ecx,0   ; default
    mov  edx,edi    ; section
    mov  dword eax,[ebp-20h] ; scenario INI
    mov  ebx,str_BuildingsGetInstantlyCaptured  ; key
    call INIClass__Get_Bool
    mov  ecx,[ebp-0x24] ; HouseClass this pointer
    mov  [ecx+0x1800],al

    Restore_Registers

    Save_Registers

    mov  ecx,0   ; default
    mov  edx,edi    ; section
    mov  dword eax,[ebp-20h] ; scenario INI
    mov  ebx,str_NoBuildingCrew  ; key
    call INIClass__Get_Bool
    mov  ecx,[ebp-0x24] ; HouseClass this pointer
    mov  [ecx+0x1801],al

    Restore_Registers

    Save_Registers

    mov  ecx,0xFF   ; default
    mov  edx,edi    ; section
    mov  dword eax,[ebp-20h] ; scenario INI
    mov  ebx,str_SecondaryColorScheme ; key
    call INIClass__Get_Int
    mov  ecx,[ebp-0x24] ; HouseClass this pointer
    mov  [ecx+0x1802],al

    Restore_Registers

    Save_Registers

    mov  ecx,1   ; default
    mov  edx,edi    ; section
    mov  dword eax,[ebp-20h] ; scenario INI
    mov  ebx,str_AllyTheNeutralHouse  ; key
    call INIClass__Get_Int

    mov  byte [allyneutral],al

    Restore_Registers
    jmp  0x004DDD36
