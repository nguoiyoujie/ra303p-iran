;----------------------------------------------------------------
; src/features/teamtype_buildings.asm
;
; Allow TeamTypes to use Building IDs. This could be used for reinforcements, though it is not certain what other possibilities there is.
;
; This function is enabled by default and is not controllable.
; No compatibility issues is expected as this was not an adjustable parameter
; 
;----------------------------------------------------------------
; For teams to actually recruit BuildingTypes, the relevant recruiting logic needs to be added to TeamClass::Recruit(int typeindex)
;   Perhaps this could be useful for undeploying an MCV?

@HOOK 0x0056069C _TeamTypeClass__Read_Add_BuildingTypes_Reading

; use movzx to support 255 buildings

_TeamTypeClass__Read_Add_BuildingTypes_Reading:
	mov     eax, ebx
	call    0x004537B4   ;  StructType BuildingTypeClass::From_Name(char *)
	cmp     al, 0FFh
	jz      .Read_AircraftType
	movzx   eax, al
	call    BuildingTypeClass__As_Reference
	jmp     0x005606C4

.Read_AircraftType:
	mov eax, ebx
	call 0x00403EF0; AircraftTypeClass::From_Name(char *)
	jmp 0x005606A3
