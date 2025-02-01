;----------------------------------------------------------------
; src/features/type_extensions/WeaponTypeClass/weapontypeclass_new_types.asm
;
; Continuation of Iran's work in enabling the game to use new WarheadTypeClass.
; 
; This function is enabled by including the section [Weapons] in Rules.ini. This section includes an indexed array of names of warheads to load.
;   [Weapons]
;   0=SuperAttack
; 
; No compatibility issues is expected as the original game lack the ability to add new types.
;
;----------------------------------------------------------------

extern Weapon__Weapons
extern WeaponTypeClass__WeaponTypeClass
extern WeaponTypeClass__new


@HACK 0x0053668A,0x0053668F,_RulesClass__Heap_Maxiums_Init_Extra_WeaponTypes
    Loop_Over_RULES_INI_Section_Entries str_Weapons, Init_WeaponTypeClass

.Ret:
    mov  eax,1
    jmp  0x0053668F
@ENDHACK


@HACK 0x00536275,0x0053627B,_RulesClass__Heap_Maxiums_Set_Weapons_Heap_Count
    mov  edx,[esi+0x1CC]
    Get_RULES_INI_Section_Entry_Count str_Weapons
    add  edx,eax
    mov  eax,Weapon__Weapons
    jmp  0x0053627B
@ENDHACK


[section .text]
Init_WeaponTypeClass:
    mov  eax,0x26
    call WeaponTypeClass__new
    test eax,eax
    jz   .Ret

    push eax
    mov  eax,edx
    ; edx should have the name of the INI section already
    call _strdup
    mov  edx,eax

    pop  eax
    call WeaponTypeClass__WeaponTypeClass
.Ret:
    retn

