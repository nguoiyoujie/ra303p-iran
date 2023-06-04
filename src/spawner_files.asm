;@HOOK 0x004F4197 _Init_Game_RULES_File ; src/ext/early_rules_ini_load.asm should make it unneeded
@HOOK 0x0054C013 _SessionClass__Read_Scenario_Descriptions_Map_Extension
@HOOK 0x0053A3E8 _Read_Scenario_Dont_Load_MPLAYER_INI_With_Spawner_Active
@HOOK 0x004F420D _Init_Game_AFTRMATH_INI_File


_Init_Game_AFTRMATH_INI_File:
    mov  edx, 0x005EBB45 ; "AFTRMATH.INI"
    Save_Registers

    call GetCommandLineA
    mov  edx, str_arg_Spawn
    call _stristr
    test eax,eax
    Restore_Registers
    jz   .No_Spawner_AFTRMATH_INI_File

    mov  edx, str_xdp_Spawnam

.No_Spawner_AFTRMATH_INI_File:
    jmp  0x004F4212

_Read_Scenario_Dont_Load_MPLAYER_INI_With_Spawner_Active:
    Save_Registers

    call GetCommandLineA

    mov  edx, str_arg_Spawn
    call _stristr
    test eax,eax

    Restore_Registers
    jne  .Dont_Load_MPlayer_INI
    jmp  .Ret

.Dont_Load_MPlayer_INI:
    jmp  0x0053A568

.Ret:
    test edx, edx
    jz   0x0053A568
    jmp  0x0053A3EE


_Init_Game_RULES_File:
    call 0x00547810 ; SmudgeTypeClass::Init_Heap(void)

    Save_Registers

    call GetCommandLineA

    mov  edx, str_arg_Spawn
    call _stristr
    test eax,eax

    je   .Ret_RULES_INI

    Restore_Registers
    mov  edx, str_xdp_Spawn
    jmp  0x004F41A1

.Ret_RULES_INI:
    Restore_Registers
    jmp  0x004F419C

_SessionClass__Read_Scenario_Descriptions_Map_Extension:

    call GetCommandLineA

    mov  edx, str_arg_Spawn
    call _stristr
    test eax,eax

    je   .Ret_MPR_extension

    push str_ext_mmm ; ".MMM"
    jmp  0x0054C018

.Ret_MPR_extension:
    push 0x005F0798 ; ".MPR"
    jmp  0x0054C018
