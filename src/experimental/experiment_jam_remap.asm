;----------------------------------------------------------------
; src/experimental/experiment_jam_remap.asm
;
; Apply a different palette to jammed buildings 
;
; This function is enabled by using the key:
;   Rules.ini > [General] > RemapJammedBuildings=yes
;
; This is a working prototype. Enable at your own risk.
;
;----------------------------------------------------------------

@HOOK 0x0056718C _TechnoClass__TechnoDrawObject_RemapJammedAsShade
; the current method in this hook prevents selling/deconstruction. Weird things could also happen if building has special animations like a war factory
;@HOOK 0x0046033B _BuildingClass__Animation_AI_FreezeJammed
@HOOK 0x004603B2 _BuildingClass__Animation_AI_AlwaysUpdateJammable

; FadingBrighten  0x006560e0
; FadingShade     0x006561e0
; FadingWayDark   0x006562e0
; FadingLight     0x006563e0
; FadingGreen     0x006564e0
; FadingYellow    0x006565e0
; FadingRed       0x006566e0

; find a way to always refresh
_TechnoClass__TechnoDrawObject_RemapJammedAsShade:
    cmp  al,RTTIType.Infantry
    jz   0x00567194
    cmp  al,RTTIType.Building
    jnz  0x00567242
    mov  al,byte [Rules.General.RemapJammedBuildings]
    cmp  al,0
    jz   0x00567242
    mov  eax,dword [ebp - 0x10]
    ;mov  al,byte [eax + 0x196]
    ;movzx eax,al
    test byte [eax + 0xd7],0x10 ;Jammed
    jz   0x00567242
    mov dword [ebp - 0x24],0x006561E0 ;FadingShade
    jmp  0x00567242

_BuildingClass__Animation_AI_FreezeJammed:
    test byte [ebx + 0xd7],0x10
    jnz  0x004605FE
    cmp  eax,ecx
    jnc  0x00460343
    sub  ecx,eax
    jmp  0x00460347

_BuildingClass__Animation_AI_AlwaysUpdateJammable:
    ; eax is the building type ID
    push ebx
    push ecx
    movzx eax,al
    BuildingTypeClass.FromIndex(eax,ebx)
    BuildingTypeClass.IsJammable.Get(ebx,cl)
    test cl,cl
    pop  ecx
    pop  ebx
    jnz  0x004603BB
    ; existing SAM-SITE check
    cmp  eax,0xf
    jnz  0x004603CB
    jmp  0x004603B7
