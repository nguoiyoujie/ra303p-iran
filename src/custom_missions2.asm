@LJMP 0x004BE468, _Hook_Expansion_Mission_Loading
;@LJMP 0x004BE491, _Hook_Expansion_Mission_Loading2
;@LJMP 0x004BE72F, _Hook_Expansion_Mission_Aftermath_Counter
@LJMP 0x004BE548, _Hook_Expansion_Mission_Counterstrike_Counter
@LJMP 0x004BE7C8, _Hook_Expansion_Mission_Counterstrike_Caption
@LJMP 0x00501E0E, _Hook_Expansion_Mission_Counterstrike_Title

[section .data]
mission_index_counter dd 0
FileClass_this2  TIMES 128 db 0
INIClass_this2 TIMES 128 db 0
sprintf_buffer   TIMES 64 db 0
newmissions_array TIMES 4096h db 0; char newmissions_array[256][64]

[section .rdata]
herpini_str db"ffg101ea",0
newmissions_str db"New Missions",0
str_newmissions_ini db"NEWMISSIONS.INI",0
str_one db"1",0
str_sprintf_format db"%d",0

;EXTERN newmissionsenabled ; defined in arguments.asm
[section .text]
_Hook_Expansion_Mission_Loading:
    cmp  byte [ebp-24h],1 ; Expansion type check
    jne  Ret_Normal
    cmp  byte [newmissionsenabled],1
    je   New_Missions_Loading

Ret_Normal:
    mov  esi,[esi+00601400h]
    jmp  0x004BE46E

New_Missions_Loading:
;    inc        eax
    cmp  ecx,1
    je   .No_Substract
    sub  ecx,13h

    .No_Substract
    push ecx ; eax is our  counter

    ;initialize FileClass
    mov  edx,str_newmissions_ini
    mov  eax,FileClass_this2
    call CCFileClass__CCFileClass

    ; check ini exists
    mov  eax,FileClass_this2
    xor  edx,edx
    call CCFileClass__Is_Available
    test eax,eax
    je   Ret_Normal ; on file not available

    ; initialize CCINIClass
    mov  eax,INIClass_this2
    call CCINIClass__CCINIClass

    ; load FileClass to CCINIClass
    mov  edx,FileClass_this2
    mov  eax,INIClass_this2
    call CCINIClass__Load

    pop  esi
    push esi ; esi contains counter


;    cmp esi,3 ; hard-coded max to read inis
;    jz    Ret_Empty_String

;    mov        dword [mission_index_counter],esi

    push esi             ; Format
    push str_sprintf_format ; %d
    lea  esi,[sprintf_buffer]
    push esi             ; Dest

    call _sprintf
    add  esp,0Ch

;    mov esi,dword newmissions_array
    pop  esi
    push esi
    imul esi,esi,32
    lea  esi,[newmissions_array+esi]
    call_INIClass__Get_String str_General,sprintf_buffer,str_EmptyString,esi,32

    pop  esi
    push esi
    imul esi,esi,32
    lea  esi,[newmissions_array+esi]
;    mov al,esi
    cmp  byte esi,0
    je   Ret_Empty_String

;    mov eax,newmissions_array

;    mov esi,eax
;    cmp dword [ebp-30h],14h
;    jnz Ret_Empty_String

    pop  esi
    imul esi,esi,32
    lea  esi,[newmissions_array+esi]
    push esi
    jmp  0x004BE46E

Ret_Empty_String:
    lea  esi,[str_EmptyString]
;    jnz 0x004BE46E
    jmp  0x004BE46E

_Hook_Expansion_Mission_Loading2:
    lea  esi,[herpini_str]
    jmp  0x004BE497

_Hook_Expansion_Mission_Aftermath_Counter:
    mov  [ebp-1CH],ebx
    mov  [ebp-30h],ecx ; Counter,starts at 20
    cmp  ecx,60h
    jmp  0x004BE738


_Hook_Expansion_Mission_Counterstrike_Counter:
    cmp  byte [ebp-24h],1 ; Expansion type check
    jne  Ret_Normal2
    cmp  byte [newmissionsenabled],1
    je   New_Missions_Counter

Ret_Normal2:
    cmp  edi,24h ; Counter,starts at 20 (14h)
    jge  0x004BE552
    jmp  0x004BE54D

New_Missions_Counter:
    cmp  edi,600h ; Counter,starts at 20 (14h)
    jge  0x004BE552
    jmp  0x004BE54D

_Hook_Expansion_Mission_Counterstrike_Caption:
    cmp  byte [newmissionsenabled],1
    je   New_Missions_Caption

    mov  eax,0x00607260
    jmp  0x004BE7CD

New_Missions_Caption:
    mov  eax,newmissions_str
    jmp  0x004BE7CD

_Hook_Expansion_Mission_Counterstrike_Title:
    cmp  byte [newmissionsenabled],1
    je   New_Missions_Title

    mov  ebx,0x00607260
    jmp  0x00501E13

New_Missions_Title:
    lea  ebx,[newmissions_str]
    jmp  0x00501E13
