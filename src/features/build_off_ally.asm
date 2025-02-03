;----------------------------------------------------------------
; src/features/build_off_ally.asm
;
; Allows you to build buildings adjacent to allied buildings
;
; This function is enabled by using the key:
;   Rules.ini > [General] > BuildOffAlly=yes
;   spawn.ini > [Settings] > BuildOffAlly=yes
;
; No compatibility issues is expected as this was not an adjustable parameter
;----------------------------------------------------------------

cextern HouseClass__As_Pointer
cextern HouseClass__Is_Ally

cextern Rules.General.BuildOffAlly

; args <HouseType to check whose alliances will be checked>, <HouseType to check for>
%macro Is_Ally 2
    mov  eax,%1
    call HouseClass__As_Pointer
    mov  edx,%2
    call HouseClass__Is_Ally
%endmacro


@HACK 0x004AF821,0x004AF826,_Build_Off_Ally_Buildings
    cmp  byte[Rules.General.BuildOffAlly],0
    jz   .Normal_Code
    Save_Registers
    xor  ecx,ecx
    mov  byte cl,[eax+0x25]
    xor  ebx,ebx
    mov  byte bl,[ebp-0x14]
    Is_Ally ecx,ebx
    cmp  eax,1
    jnz  .Not_Ally
    Restore_Registers
    jmp  0x004AF826
.Not_Ally:
    Restore_Registers
    jmp  0x004AF82E
.Normal_Code:
    cmp  dl,[eax+0x25]
    jnz  0x004AF82E
    jmp  0x004AF826
@ENDHACK


@HACK 0x004AF9D3,0x004AF9D8,_Build_Off_Ally_Buildings2
    cmp  byte[Rules.General.BuildOffAlly],0
    jz   .Normal_Code
    Save_Registers
    xor  ecx,ecx
    mov  byte cl,[eax+0x25]
    xor  ebx,ebx
    mov  byte bl,[ebp-0x14]
    Is_Ally ecx,ebx
    cmp  eax,1
    jnz  .Not_Ally
    Restore_Registers
    jmp  0x004AF9D8
.Not_Ally:
    Restore_Registers
    jmp  0x004AFA12
.Normal_Code:
    cmp  bh,[eax+0x25]
    jnz  0x004AFA12
    jmp  0x004AF9D8
@ENDHACK


@HACK 0x004AFAF5,0x004AFAFD,_Build_Off_Ally_Buildings3
    cmp  byte[Rules.General.BuildOffAlly],0
    jz   .Normal_Code
    Save_Registers
    xor  ecx,ecx
    mov  byte cl,[eax+0x25]
    xor  ebx,ebx
    mov  byte bl,[ebp-0x14]
    Is_Ally ecx,ebx
    cmp  eax,1
    jnz  .Not_Ally
    Restore_Registers
    jmp  0x004AFAFD
.Not_Ally:
    Restore_Registers
    jmp  0x004AFAAD
.Normal_Code:
    mov  al,[eax+0x25]
    cmp  byte al,[ebp-0x14]
    jnz  0x004AFAAD
    jmp  0x004AFAFD
@ENDHACK


@HACK 0x004AFB82,0x004AFB87,_Build_Off_Ally_Buildings4
    cmp  byte[Rules.General.BuildOffAlly],0
    jz   .Normal_Code_
    Save_Registers
    xor  ecx,ecx
    mov  byte cl,[eax+0x25]
    xor  ebx,ebx
    mov  byte bl,[ebp-0x14]
    Is_Ally ecx,ebx
    cmp  eax,1
    jnz  .Not_Ally
    Restore_Registers
    jmp  0x004AFB87
.Not_Ally:
    Restore_Registers
    jmp  0x004AFB98
.Normal_Code_:
    nop
    nop
    nop
    nop
    cmp  dl,[eax+0x25]
    jnz  0x004AFB98
    jmp  0x004AFB87
@ENDHACK


@HACK 0x004AFC3E,0x004AFC43,_Build_Off_Ally_Buildings5
    cmp  byte[Rules.General.BuildOffAlly],0
    jz   .Normal_Code
    Save_Registers
    xor  ecx,ecx
    mov  byte cl,[eax+0x25]
    xor  ebx,ebx
    mov  byte bl,[ebp-0x14]
    Is_Ally ecx,ebx
    cmp  eax,1
    jnz  .Not_Ally
    Restore_Registers
    jmp  0x004AFC43
.Not_Ally:
    Restore_Registers
    jmp  0x004AFBCF
.Normal_Code:
    cmp  ch,[eax+0x25]
    jnz  0x004AFBCF
    jmp  0x004AFC43
@ENDHACK

