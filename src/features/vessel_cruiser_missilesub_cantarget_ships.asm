;----------------------------------------------------------------
; src/features/vessel_cruiser_missilesub_cantarget_ships.asm
;
; Allows Cruisers and Missile Subs to target naval units. 
; 
; This function is enabled by default and is not controllable.
; No compatibility issues is expected as Helicarriers were not expected to be used by the AI in the original game. Modders and mappers beware though.
; 
;----------------------------------------------------------------

@HOOK 0x0058AC6C _VesselClass__What_Action__Remove_Attack_Restrictions

_VesselClass__What_Action__Remove_Attack_Restrictions:
    jmp  0x0058ACE4

