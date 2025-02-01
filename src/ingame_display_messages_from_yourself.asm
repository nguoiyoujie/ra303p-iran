;----------------------------------------------------------------
; src/features/ingame_chat_improvments.asm
;
; Game will now include text messages sent by yourself
; 
; This function is enabled by default and is not configurable.
; No compatibility issues is expected. 
;
;----------------------------------------------------------------

extern Globals___Rule_MessageDelay


@HACK 0x004A731C,0x004A7321,_Message_Input_Display_Message_After_Sending_To_Players
    Save_Registers
    ; Calculate duration the message is displayed for
    xor  ebx,ebx
    mov  bx,[Globals___Rule_MessageDelay]
    lea  eax,[ebx*8]
    sub  eax,ebx
    shl  eax,5
    add  eax,ebx
    shl  eax,2
    add  eax,0x80
    shr  eax,8
    push eax ; Message display duration
    push 0x4046 ; TextPrintType?
    mov  al,byte[0x0067F313]
    movsx eax,al
    push eax ; PlayerColorType arg
    mov  ecx,0x00680189
    mov  bl,byte[0x00680201]
    movsx ebx,bl
    mov  edx,0x0068017D ; offset byte_0068017D, text to display
    mov  eax,0x0067F5A8; offset MessageListClass_67F5A8
    call 0x0050542C    ; TextLabelClass * MessageListClass::Add_Message(char *, int, char *, PlayerColorType, TextPrintType, int)
.Ret:
    Restore_Registers
    mov  esi,0x00680189 ; (offset dword_00680186+3)
    jmp  0x004A7321
@ENDHACK
