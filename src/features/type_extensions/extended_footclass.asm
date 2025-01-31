@LJMP 0x004C3343,_FootClass__Can_Demolish_Patch_Service_Depot_Vehicle_Sell

; ebx contains FootClass this pointer
_FootClass__Can_Demolish_Patch_Service_Depot_Vehicle_Sell:
    Save_Registers
    push ebx
    xor  esi,esi
    xor  edi,edi
;    cmp     byte al,1
;    jz      .Return_False

    jmp  .Loop_Start

.Next_Iteration_Heap_Stuff1:
    mov  ebx,[Globals___BuildingTypes]
    mov  eax,edx
    imul eax,[ebx+4]
    mov  ebx,[ebx+0x10]
    add  ebx,eax
.Next_Iteation:
    mov  al,[ebx+0x1A4]
    movzx eax,al
    cmp  eax,0x18        ; Check if structtype is Service Depot
    jnz  .Increment_Loop_Counter

    mov  eax,ecx ; ecx = BuildingClass pointer, move to eax for this pointer
    mov  edx,[eax+0x11]
    call dword[edx+0x10]
    mov  edx,eax ; eax now contains the coord result of building in eax,move it into edx

    pop  ecx     ; FootClass this pointer
    push ecx

    mov  eax,ecx ; Move FootClass this pointer into eax
    mov  ecx,[eax+0x11]
    call dword[ecx+0x10]
    ; eax now contains coord of footclass
    call Coord___Distance_As_Coord
    cmp  eax,0x80        ; Check for less of a cell distance?
    jl   .Return_True ; Return true if distance is small enough

.Increment_Loop_Counter:
    add  edi,4
    inc  esi

.Loop_Start:
    mov  eax,[0x0065D8BC] ;  ds:dword_0065D8BC
    cmp  esi,eax
    jge  .Return_False
    mov  eax,[0x0065D8E4] ; ds:BuildingClass_Heap_Related?
    mov  ebx,[edi+eax]
    mov  ecx,ebx
    test ebx,ebx
    jz   .Increment_Loop_Counter
    test byte[ebx+0x15],8
    jnz  .Increment_Loop_Counter
;   mov     edx,[ebp+This_Pointer]
;   lea     eax,[ebx+0x93]
;   call    operator==(CCPtr<HouseClass> &,HouseClass *)
;   test    eax,eax        ; Check if building house is the same as ours
;   jz      short Increment_Loop_Counter
    lea  eax,[ebx+0xCD]
    mov  edx,[eax]
    cmp  edx,0xFFFFFFFF
    jnz  .Next_Iteration_Heap_Stuff1
    xor  ebx,ebx
    jmp  .Next_Iteation

.Return_True:
    pop  ebx
    Restore_Registers
    mov  eax,1
    jmp  0x004C33BC

.Return_False:
    pop  ebx
    Restore_Registers
    xor  eax,eax
    jmp  0x004C33BC
