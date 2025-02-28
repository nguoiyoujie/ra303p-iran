;----------------------------------------------------------------
; src/hires/hires.asm
;
; Bulk code for enabling custom resolutions
;
; This function is enabled by default and is not controllable.
; No compatibility issues is expected as this was not an adjustable parameter
;----------------------------------------------------------------
;
; Copyright (c) 2012 Toni Spets <toni.spets@iki.fi>
;
; Permission to use, copy, modify, and distribute this software for any
; purpose with or without fee is hereby granted, provided that the above
; copyright notice and this permission notice appear in all copies.
;
; THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES
; WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
; MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR
; ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
; WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN
; ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF
; OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
;

; derived from ra95-hires

;@HOOK 0x004B03AA _DisplayClass_Click_Cell_Calc_Redraw_GScreen
@HOOK 0x0049F600 _CellClass_Draw_It_Dont_Draw_Past_Map_Border

@HOOK 0x004ABBDF _Shake_The_Screen_Height2
@HOOK 0x004AB8A8 _Shake_The_Screen_Height1

;@HOOK 0x00507DFB _hires_Net_Join_MessageBox
@HOOK 0x00507887 _hires_Net_Join_Playing_As_Text_Print
@HOOK 0x00508074 _hires_Net_Join_AI_Players_Text_Print
@HOOK 0x00508016 _hires_Net_Join_Credits_Text_Print
@HOOK 0x00507F97 _hires_Net_Join_Tech_Level_Text_Print
@HOOK 0x00507F33 _hires_Net_Join_Unit_Count_Text_Print
@HOOK 0x00508565 _hires_Net_Join_Color_Box_Select_Thingy3
@HOOK 0x00508525 _hires_Net_Join_Color_Box_Select_Thingy2
@HOOK 0x0050854B _hires_Net_Join_Color_Box_Select_Thingy
@HOOK 0x00507BDC _hires_Net_Join_Color_Draw_Boxes2
@HOOK 0x00507BBB _hires_Net_Join_Color_Draw_Boxes
@HOOK 0x00507B48 _hires_Net_Join_Color_Draw_Colored_Rectangles
@HOOK 0x005077C2 _hires_Net_Join_Color_Text_Print
@HOOK 0x0050779F _hires_Net_Join_Side_Text_Print
@HOOK 0x0050777C _hires_Net_Join_Name_Text_Print
@HOOK 0x0050774B _hires_Net_Join_Players_Text_Print
@HOOK 0x00507728 _hires_Net_Join_Games_Text_Print
@HOOK 0x00506E0C _hires_Net_Join_Static_Button
@HOOK 0x00506DA9 _hires_Net_Join_Credits_Slider
@HOOK 0x00506CE4 _hires_Net_Join_Join_Button
@HOOK 0x00506C32 _hires_Net_Join_Country_Box
@HOOK 0x00506BDC _hires_Net_Join_Name_Box
@HOOK 0x00506931 _hires_Net_Join_Dialog

@HOOK 0x0050C33D _hires_Net_New_AI_Players_Text_Print
@HOOK 0x0050C31D _hires_Net_New_Credits_Text_Print
@HOOK 0x0050C2FD _hires_Net_New_Tech_Level_Text_Print
@HOOK 0x0050C2DD _hires_Net_New_Unit_Count_Text_Print
@HOOK 0x0050C2C0 _hires_Net_New_Scenario_Text_Print
@HOOK 0x0050C2A3 _hires_Net_New_Players_Text_Print
@HOOK 0x0050B97D _hires_Net_New_Dialog_OK_Button
@HOOK 0x0050B8A9 _hires_Net_New_Dialog2
@HOOK 0x0050B70D _hires_Net_New_Dialog

@HOOK 0x005D1801 _Receive_Remote_File_Caption
@HOOK 0x005D17F3 _Receive_Remote_File_Dialog
@HOOK 0x005D162E _Receive_Remote_File_Text_Button
@HOOK 0x005D1663 _Receive_Remote_File_Gauge_Gadget
@HOOK 0x005D1827 _Receive_Remote_File_Text_Print
@HOOK 0x005D2182 _Send_Remote_File_Text_Print
@HOOK 0x005D1D25 _Send_Remote_File_Text_Gauge_Gadget
@HOOK 0x005D1CFC _Send_Remote_File_Text_Button
@HOOK 0x005D215C _Send_Remote_File_Caption
@HOOK 0x005D214E _Send_Remote_File_Dialog
@HOOK 0x0053A376 _Start_Scenario_Set_Flag_To_Redraw_Screen
@HOOK 0x005523C6 _Set_Screen_Height_480_NOP
@HOOK 0x005525D7 _Set_Screen_Height_400_NOP
@HOOK 0x005525E6 _No_Black_Bars_In_640x480
@HOOK 0x00552974 _hires_ini
@HOOK 0x004A9EA9 _hires_Intro
@HOOK 0x005B3DBF _hires_MainMenu
@HOOK 0x004F479B _hires_MainMenuClear
;@HOOK 0x004F6090 _hires_MainMenuClearBackground ; load blackbackground.pcx
@HOOK 0x005B3DAA _Load_Title_Screen_Clear_Background
@HOOK 0x005B3CD8 _hires_ScoreScreenBackground
@HOOK 0x004F75FB _hires_MainMenuClearPalette
;@HOOK 0x0053BE6C _hires_RestateMissionClearBackground ; uses blackbackground.pcx, not needed anymore
;@HOOK 0x0053B806 _hires_DoRestartMissionClearBackground ; uses blackbackground.pcx, not needed anymore
@HOOK 0x005518A3 _hires_NewGameText
@HOOK 0x005128D4 _hires_SkirmishMenu
@HOOK 0x0054D009 _hires_StripClass
@HOOK 0x004BE377 _NewMissions_Handle_Hires_Buttons_A
@HOOK 0x004BE39E _NewMissions_Handle_Hires_Buttons_B
;@HOOK 0x00527C19 _hires_Power_Usage_Indicator_Height
;@HOOK 0x0050692B _hires_NetworkJoinMenu
;@HOOK 0x00506CEE _hires_Network_Join_Button
;@HOOK 0x00506CBC _hires_Network_Color_List
;@HOOK 0x00506BDC _hires_Network_Name_EditBox
;@HOOK 0x00506C28 _hires_Network_Country_DropList
;@HOOK 0x00506C73 _hires_Network_Channel
;@HOOK 0x0050721F _hires_Network_Join_ChatBox
;@HOOK 0x00507DEF _hires_Network_Join_DrawBox
;@HOOK 0x00507E10 _hires_Network_Join_DrawBox2
;@HOOK 0x00507BB1 _hires_Network_Join_ColorBoxes
;@HOOK 0x00507BD2 _hires_Network_Join_ColorBoxes2
;@HOOK 0x00507C0C _hires_Network_Join_Fill_ColorBoxes
@HOOK 0x0050253A _hires_MainMenu_AntMissions_Select
@HOOK 0x005024AF _hires_MainMenu_Credits_Select
@HOOK 0x005B30D0 _hires_Deinterlace_Videos
@HOOK 0x005E548D _hires_Deinterlace_Videos_Fix_Bottom_Line
@HOOK 0x004A9EA9 _hires_Center_VQA640_Videos
;@HOOK 0x005B2FE6 _hires_Deinterlace_Videos_Always_Deinterlace
;@HOOK 0x005B3023 _hires_Deinterlace_Videos2
;@HOOK 0x004A8C6A _hires_Videos
;@HOOK 0x004A8AC6 _hires_Videos2
;@HOOK 0x0050223E _Blacken_Screen_Border_Menu
;@HOOK 0x0050228E _Blacken_Screen_Border_Menu2
;@HOOK 0x0054DFF5 _StripClass_Add

;@HOOK 0x0054E9C2 _hires_Sidebar_Cameos_Draw
;@HOOK 0x0054CF42 _hires_Sidebar_Cameos_Init
;@HOOK 0x0054DFAE _hires_Sidebar_Cameos_Init_IO
;@HOOK 0x0054DFF8 _hires_Sidebar_Cameos_Init_IO2
;@HOOK 0x0054DE8B _hires_Sidebar_Cameos_Init_IO3
;@HOOK 0x0054DEBE _hires_Sidebar_Cameos_Init_IO4
;@HOOK 0x0054DF4A _hires_Sidebar_Cameos_Init_IO5
;@HOOK 0x0054DF15 _hires_Sidebar_Cameos_Init_IO6
;@HOOK 0x0054E142 _hires_Sidebar_Cameos_Activate
;@HOOK 0x0054E156 _hires_Sidebar_Cameos_Activate2
;@HOOK 0x0054E172 _hires_Sidebar_Cameos_Activate3
;@HOOK 0x0054E1CC _hires_Sidebar_Cameos_Deactivate
;@HOOK 0x0054E1E8 _hires_Sidebar_Cameos_Deactivate2
;@HOOK 0x0054E2AD _hires_Sidebar_Cameos_Scroll ; broke atm?
;@HOOK 0x0054E4BE _hires_Sidebar_Cameos_AI
;@HOOK 0x0054D08B _hires_Sidebar_Cameos_Height
;@HOOK 0x0054E72A _hires_Sidebar_Cameos_Draw_Buttons

@HOOK 0x0050E7E9 _hires_Reconnect_Dialog_Fill_Rect2
@HOOK 0x0050E7F1 _hires_Reconnect_Dialog_Fill_Rect
@HOOK 0x0050E4FD _hires_Reconnect_Dialog_Dialog_Box
@HOOK 0x0050E5D2 _hires_Reconnect_Dialog_Text_Print1
@HOOK 0x0050E554 _hires_Reconnect_Dialog_Text_Print2
@HOOK 0x0050E526 _hires_Reconnect_Dialog_Text_Print3
@HOOK 0x0050E5A0 _hires_Reconnect_Dialog_Text_Print4
@HOOK 0x0050E845 _hires_Reconnect_Dialog_Text_Print5

_hires_Reconnect_Dialog_Fill_Rect:
    mov  edx, [ebp-30h]
    add  edx, [diff_top]
    push edx
    mov  ebx, [ebp-28h]
    add  ebx, [diff_left]
    push ebx
    jmp  0x0050E7F9

_hires_Reconnect_Dialog_Fill_Rect2:
    mov  ecx, [ebp-24h]  ; Top
    add  ecx, [diff_top]
    push ecx
    mov  eax, [ebp-34h]  ; Left
    add  eax, [diff_left]
    push eax
    jmp  0x0050E7F1

_hires_Reconnect_Dialog_Text_Print5:
    add  eax, [diff_top]
    push eax
    mov  eax, 0x140
    add  eax, [diff_left]
    push eax
    jmp  0x0050E84B

_hires_Reconnect_Dialog_Text_Print4:
    add  eax, [diff_top]
    push eax
    mov  eax, 0x140
    add  eax, [diff_left]
    push eax
    jmp  0x0050E5A6

_hires_Reconnect_Dialog_Text_Print3:
    add  eax, [diff_top]
    push eax
    mov  eax, 0x140
    add  eax, [diff_left]
    push eax
    jmp  0x0050E52C

_hires_Reconnect_Dialog_Text_Print2:
    add  eax, [diff_top]
    push eax
    mov  eax, 0x140
    add  eax, [diff_left]
    push eax
    jmp  0x0050E55A

_hires_Reconnect_Dialog_Text_Print1:
    add  eax, [diff_top]
    push eax
    mov  eax, 0x140
    add  eax, [diff_left]
    push eax
    jmp  0x0050E5D8


_hires_Reconnect_Dialog_Dialog_Box:
    mov  edx, [0x006851A0] ; top
    add  edx, [diff_top]
    mov  eax, [0x0068519C] ; left
    add  eax, [diff_left]
    jmp  0x0050E508

CellSize dd 100h
fake480height dd 0

_Receive_Remote_File_Caption:
    mov  ebx, 0x6e
    add  ebx, [diff_top]
    mov  edx, 0x50
    add  edx, [diff_left]
    xor  eax, eax
    jmp  0x005D1807

_Receive_Remote_File_Dialog:
    mov  edx, 0x6e
    add  edx, [diff_top]
    mov  eax, 0x78
    add  eax, [diff_left]
    jmp  0x005D17F9

_Receive_Remote_File_Text_Button:
    mov  ecx, 0xFA
    add  ecx, [diff_top]
    push ecx
    mov  ebx, 0x118
    add  ebx, [diff_left]
    push ebx

    mov  ecx, 4116h
    mov  ebx, 13h
    jmp  0x0005D1642

_Receive_Remote_File_Gauge_Gadget:
    lea  eax, [ebp-104h]
    mov  ecx, 0xC0
    add  ecx, [diff_top]
    mov  ebx, 0xDC
    add  ebx, [diff_left]
    jmp  0x005D166B

_Receive_Remote_File_Text_Print:
    mov  ecx, 0xA0
    add  ecx, [diff_top]
    mov  edx, 0x140
    add  edx, [diff_left]
    jmp  0x005D182D


_Send_Remote_File_Text_Print:
;ecx = 000000A0 edx = 00000140
    mov  ecx, 0xA0
    add  ecx, [diff_top]
    mov  edx, 0x140
    add  edx, [diff_left]
    jmp  0x005D2188


_Send_Remote_File_Text_Gauge_Gadget:
;ecx = 00000014 ebx = 000000C8
    mov  ecx, 0xC0
    add  ecx, [diff_top]
    mov  ebx, 0xDC
    add  ebx, [diff_left]
    jmp  0x005D1D2A

_Send_Remote_File_Text_Button:
    mov  ecx, 0xFA
    add  ecx, [diff_top]
    mov  esi, 0x118
    add  esi, [diff_left]
    jmp  0x005D1D02

_Send_Remote_File_Caption:
    mov  ebx, 0x6e
    add  ebx, [diff_top]
    mov  edx, 0x50
    add  edx, [diff_left]
    xor  eax, eax
    jmp  0x005D2164

_Send_Remote_File_Dialog:
    mov  edx, 0x6e
    add  edx, [diff_top]
    mov  eax, 0x50
    add  eax, [diff_left]
    jmp  0x005D2154


_CellClass_Draw_It_Dont_Draw_Past_Map_Border:
    push eax
    push edx

    pop  edx
    pop  eax

    push eax
    push edx
    mov  ax, [eax]
    movsx edx, ax
    mov  eax, Globals___Map
    call MapClass__In_Radar
    test eax, eax
    jz   .Out

    pop  edx
    pop  eax
    mov  [ebp-0Ch], eax
    mov  edi, edx
    jmp  0x0049F605

.Out:
    pop  edx
    pop  eax
    jmp  0x0049FC47

_Start_Scenario_Set_Flag_To_Redraw_Screen:
    mov  ecx, 1
    lea  ebx, [CellSize]
    mov  edx, 1h
    mov  eax, Globals___Map
    call 0x004D2B6C ; HelpClass::Scroll_Map(DirType,int &,int)

    mov  edx, 1
    mov  eax, Globals___Map
    call GScreenClass__Flag_To_Redraw

    mov  eax, 0x00668188 ; GameOptionsClass Options
    jmp  0x0053A37B

_hires_Center_VQA640_Videos:
    mov  eax, [diff_top]
    push eax
    mov  eax, [diff_left]
    push eax

    push 0
    push 0

    jmp  0x004A9EB1

scorebackground db 0

_hires_ScoreScreenBackground:
    cmp  eax, 0x005F01EB
    je   .Is_Score_Screen
    cmp  eax, 0x005F01F8
    je   .Is_Score_Screen
    jmp  .Ret

.Is_Score_Screen:
    mov  byte [scorebackground], 1

.Ret:
    push ebp
    mov  ebp, esp
    push ecx
    push esi
    push edi
    jmp  0x005B3CDE

; These are per strip, there's a left and right strip in the sidebar
%define CAMEO_ITEMS 30
%define CAMEOS_SIZE    1560 ; memory size of all cameos in byte

%define ScreenWidth     0x006016B0
%define ScreenHeight    0x006016B4

%define _Buffer_Fill_Rect 0x005C23F0

%define _Buffer_Clear 0x005C4DE0

%define GraphicsViewPortClass_HidPage 0x006807CC
%define GraphicBufferClass_VisiblePage 0x0068065C
%define GraphicsViewPortClass_SeenBuff 0x006807A4

%macro hires_Clear 0
    push 0ch
    push GraphicsViewPortClass_HidPage
    call _Buffer_Clear
    add  esp,8
%endmacro

%macro hires_Clear_2 0
    push 0
    push GraphicBufferClass_VisiblePage
;    push GraphicBufferClass_SeenBuffer
    call _Buffer_Clear
    add  esp,8
%endmacro

_Load_Title_Screen_Clear_Background:
    mov  eax, 1

    hires_Clear

    jmp  0x005B3DAF

_hires_Sidebar_Cameos_Draw_Buttons:
    cmp  ebx, 1
    jge  0x0054E754
    jmp  0x0054E72F

_hires_Sidebar_Cameos_Height:
    mov  edx, 370h
    mov  ecx, 0A0h
    mov  esi, 210h
    mov  edi, 0B4h
    jmp  0x0054D09F

_hires_Sidebar_Cameos_AI: ; No idea if this does anything..
    mov  ecx, [eax+5]
    add  eax, CAMEO_ITEMS
    jmp  0x0054E4C4

str_blackbackgroundpcx db"BLACKBACKGROUND.PCX",0

_hires_DoRestartMissionClearBackground:
    push ecx
    push ebx
    push edx
    push eax

    mov  ebx, 0x0066995C
    mov  edx, GraphicsViewPortClass_HidPage
    mov  eax, str_blackbackgroundpcx
    call 0x005B3CD8

    pop  eax
    pop  edx
    pop  ebx
    pop  ecx

    mov  eax, [Globals___Keyboard]
    jmp  0x0053B80B

_hires_RestateMissionClearBackground:
    push ecx
    push ebx
    push edx
    push eax

    mov  ebx, 0x0066995C
    mov  edx, GraphicsViewPortClass_HidPage
    mov  eax, str_blackbackgroundpcx
    call 0x005B3CD8

    pop  eax
    pop  edx
    pop  ebx
    pop  ecx

    mov  ebx, 0x005F9348
    jmp  0x0053BE71

_hires_MainMenuClearBackground:

    hires_Clear

    mov  ecx, eax
    push ecx

;    mov     ebx, 0x0066995C
;    mov     edx, GraphicsViewPortClass_HidPage
;    mov     eax, str_blackbackgroundpcx
;    call    0x005B3CD8

    pop  eax
    mov  ebx, 0x0066995C
    jmp  0x004F6097

ExtendedSelectButtons8 TIMES 824 dd 0
%define DefaultSelectButtons 0x0068A2C4

_hires_Sidebar_Cameos_Init_IO6:     ; Down buttons
    add  esi, 0C2h
    add  esi, [diff_height]
    jmp  0x0054DF1B

_hires_Sidebar_Cameos_Init_IO5:     ; Down buttons
    add  ebx, 0C2h
    add  ebx, [diff_height]
    jmp  0x0054DF50

_hires_Sidebar_Cameos_Init_IO4:     ; Up buttons
    add  ebx, 0C2h
    add  ebx, [diff_height]
    jmp  0x0054DEC4

_hires_Sidebar_Cameos_Init_IO3:  ; Up buttons
    add  eax, 0C2h
    add  eax, [diff_height]
    jmp  0x0054DE90

_hires_Sidebar_Cameos_Scroll:
    add  edx, CAMEO_ITEMS
    cmp  edx, ebx
    jmp  0x0054E2B2

_hires_Sidebar_Cameos_Deactivate2:
;;    int 3
    cmp  ebx, CAMEOS_SIZE ; 208 / 52 = 4 items
    jmp  0x0054E1EE

_hires_Sidebar_Cameos_Deactivate:
    imul edx, [ecx+19h], CAMEOS_SIZE
;;    add        edx, DefaultSelectButtons
    add  edx, ExtendedSelectButtons8
    jmp  0x0054E1D9

_hires_Sidebar_Cameos_Activate3:
    cmp  ebx, CAMEOS_SIZE ; 208 / 52 = 4 items
    jmp  0x0054E178

_hires_Sidebar_Cameos_Activate2:
    imul edx, [ecx+19h], CAMEOS_SIZE
;;    add        edx, DefaultSelectButtons
    add  edx, ExtendedSelectButtons8
    jmp  0x0054E163

_hires_Sidebar_Cameos_Activate:
    imul eax, [ecx+19h], CAMEOS_SIZE
;;    add        eax, DefaultSelectButtons
    add  eax, ExtendedSelectButtons8
    jmp  0x0054E14E

_hires_Sidebar_Cameos_Init_IO2:
    cmp  esi, CAMEO_ITEMS ; items check
    jl   0x0054DFAE
    jmp  0x0054DFFD

_hires_Sidebar_Cameos_Init_IO:
    imul eax, [ecx+19h], CAMEOS_SIZE
;;    add        eax, DefaultSelectButtons
    add  eax, ExtendedSelectButtons8
    jmp  0x0054DFBA

_hires_Sidebar_Cameos_Init:
    mov  edx, CAMEO_ITEMS*2 ; amount of total items to init
    mov  dword [0x00604D68], eax

;;    mov        eax, DefaultSelectButtons
    mov  eax, ExtendedSelectButtons8
    jmp  0x0054CF51

_hires_Sidebar_Cameos_Draw:
    add  eax, CAMEO_ITEMS; items to draw
    cmp  eax, edx
    jmp  0x0054E9C7

AdjustedWidth           dd 0

diff_width              dd 0
diff_height             dd 0
diff_top                dd 0
diff_left               dd 0

str_options             db"Options",0
str_width               db"Width",0
str_height              db"Height",0

left_strip_offset       dd 0
right_strip_offset      dd 0

%macro _hires_adjust_width 1
    mov  ecx, [diff_width]
    mov  eax, %1
    add  [eax], ecx
%endmacro

%macro _hires_adjust_height 1
    mov  ecx, [diff_height]
    mov  eax, %1
    add  [eax], ecx
%endmacro

%macro _hires_adjust_top    1
    mov  ecx, [diff_top]
    mov  eax, %1
    add  [eax], ecx
%endmacro

%macro _hires_adjust_left    1
    mov  ecx, [diff_left]
    mov  eax, %1
    add  [eax], ecx
%endmacro

; handles Width and Height redalert.ini options
_hires_ini:

    push ebx
    push edx

    .width:
    mov  ecx, 640            ; default
    mov  edx, str_options    ; section
    mov  ebx, str_width      ; key
    lea  eax, [ebp-0x54]     ; this
    call INIClass__Get_Int
    test eax,eax
    je   .height
    mov  dword [ScreenWidth], eax

.height:
    mov  ecx, 400
    mov  edx, str_options
    mov  ebx, str_height
    lea  eax, [ebp-0x54]
    call INIClass__Get_Int
    test eax,eax
    je   .cleanup
    mov  dword [ScreenHeight], eax

.cleanup:

    ; adjust width
    mov  eax, [ScreenWidth]
    sub  eax, 160
    mov  ebx, 24
    xor  edx,edx
    DIV  ebx

    ; width of the game area, in tiles, 1 tile = 24px
    mov  byte [0x0054DB15], AL

    xor  edx,edx
    mov  ebx, 24
    MUL  ebx

    add  eax, 160
    mov  [AdjustedWidth], eax

    ; adjusted width in eax
    mov  edx, [AdjustedWidth]
    mov  ebx, [ScreenHeight]

    sub  edx, 640
    sub  ebx, 400

    mov  [diff_width], edx
    mov  [diff_height], ebx

    ; adjust top and left
    mov  eax, [ScreenHeight]
    SHR  eax, 1
    sub  eax, 200
    mov  [diff_top], eax

    mov  eax, [ScreenWidth]
    SHR  eax, 1
    sub  eax, 320
    mov  [diff_left], eax

    mov  edx, [AdjustedWidth]
    mov  ebx, [ScreenHeight]

;    cmp dword [ScreenHeight], 480
;    jz    .Ret

    mov  edx, [AdjustedWidth]
    mov  ebx, [ScreenHeight]

;    mov ecx, 100
;    mov eax, 0x004A8AE1
;    add [eax], ecx

    ; main menu please wait...
    _hires_adjust_top     0x004F43BF
    _hires_adjust_left    0x004F43C4

    ; main menu version
    _hires_adjust_top     0x00501D68
    _hires_adjust_left    0x00501D63

    ; main menu buttons
    _hires_adjust_top     0x00501DBE
    _hires_adjust_left    0x00501DB9

    ; new game skill select
    ; ... ok button
    _hires_adjust_top     0x005517CB
    _hires_adjust_left    0x005517DA

    ; ... dialog
    _hires_adjust_top     0x0055188A
    _hires_adjust_left    0x0055188F

    ; ... slider
    _hires_adjust_top     0x005517F0
    _hires_adjust_left    0x005517F5

    ; load/save game dialogs
    _hires_adjust_top     0x004FCED5
    _hires_adjust_left    0x004FCED0

    ; ... list
    _hires_adjust_top     0x004FCF00
    _hires_adjust_left    0x004FCEFB

    ; ... mission description
    _hires_adjust_top     0x004FCF05
    _hires_adjust_left    0x004FCEDA

    ; ... buttons
    _hires_adjust_top     0x004FCF36
    _hires_adjust_left    0x004FCF31
    _hires_adjust_left    0x004FCF0A

    ; multiplayer dialog
    _hires_adjust_top     0x0050347D
    _hires_adjust_left    0x00503482

    ; ... modem/serial
    _hires_adjust_top     0x005034F5
    _hires_adjust_left    0x00503502

    ; ... skirmish
    _hires_adjust_top     0x0050351D
    _hires_adjust_left    0x0050352C

    ; ... network
    _hires_adjust_top     0x0050354A
    _hires_adjust_left    0x00503559

    ; ... internet
    _hires_adjust_top     0x00503577
    _hires_adjust_left    0x00503586

    ; ... cancel
    _hires_adjust_top     0x005034C9
    _hires_adjust_left    0x0050349D

    ; skirmish dialog
    ; ... all items offset top
    _hires_adjust_top     0x00512907

    ; ... some items offset left
    _hires_adjust_left    0x00512902
    _hires_adjust_left    0x0051293A
    _hires_adjust_left    0x00512944
    _hires_adjust_left    0x0051296B

    ; sound controls dialog
    _hires_adjust_top     0x005502A9
    _hires_adjust_left    0x005503BA

    ; ... song list
    _hires_adjust_top     0x00550304
    _hires_adjust_left    0x005502E4

    ; ... ok button
    _hires_adjust_top     0x00550331
    _hires_adjust_left    0x00550341

    ; ... stop button
    _hires_adjust_top     0x00550356
    _hires_adjust_left    0x00550360

    ; ... play button
    _hires_adjust_top     0x0055037C
    _hires_adjust_left    0x00550386

    ; ... shuffle button
    _hires_adjust_top     0x005503B5
    _hires_adjust_left    0x005503C2

    ; ... repeat button
    _hires_adjust_top     0x005503E7
    _hires_adjust_left    0x005503F6

    ; ... music volume slider
    _hires_adjust_top     0x0055040F
    _hires_adjust_left    0x00550414

    ; ... sound volume slider
    _hires_adjust_top     0x00550432
    _hires_adjust_left    0x00550437

    ; ... gadget offset top
    _hires_adjust_top     0x0055045A

    ; surrender dialog
    _hires_adjust_top     0x00503F0D
    _hires_adjust_left    0x00503F05

    ; ... ok button
    _hires_adjust_top     0x00503E3C
    _hires_adjust_left    0x00503E4B

    ; ... cancel button
    _hires_adjust_top     0x00503E66
    _hires_adjust_left    0x00503E75

    ; ... caption
    _hires_adjust_top     0x00503F3A
    _hires_adjust_left    0x00503F3F

    ; scrolling
    _hires_adjust_width   0x00547119
    _hires_adjust_width   0x00547129
    _hires_adjust_width   0x00547130
    _hires_adjust_width   0x0054713D
    _hires_adjust_left    0x00547144
    _hires_adjust_height  0x00547177
    _hires_adjust_height  0x00547187
    _hires_adjust_height  0x0054718E
    _hires_adjust_left    0x00547193
    _hires_adjust_top     0x0054719A

    ; buffer1
    _hires_adjust_height  0x00552629
    _hires_adjust_width   0x00552638

    ; buffer2
    _hires_adjust_height  0x00552646
    _hires_adjust_width   0x00552655

    ; power bar background
    _hires_adjust_width   0x00527736
    _hires_adjust_width   0x0052775C

    ; side bar background position
    _hires_adjust_width   0x0054D7CB
    _hires_adjust_width   0x0054D7F1
    _hires_adjust_width   0x0054D816

    ; Bottom side bar shape height
;     _hires_adjust_height  0x0054D08C

    ; side bar bottom shape position height
;    _hires_adjust_height  0x0054D811

    ; credits tab background position
    _hires_adjust_width   0x00553758

    ; timer tab backgroound position
    _hires_adjust_width   0x0055383A
    ; timer tab caption/text
    _hires_adjust_width   0x004ACEE5
    _hires_adjust_width   0x004ACEC6

    ; power bar current position
    _hires_adjust_width   0x005275D9

    ; repair button left offset
    _hires_adjust_width   0x0054D166

    ; sell button left offset
    _hires_adjust_width   0x0054D1DA

    ; map button left offset
    _hires_adjust_width   0x0054D238

    ; side bar strip offset left (left bar)
    _hires_adjust_width   [left_strip_offset]

    ; side bar strip icons offset
    _hires_adjust_width   0x0054D08C

    ; side bar strip offset left (right bar)
    _hires_adjust_width   [right_strip_offset]

    ; power indicator (darker shadow)
    _hires_adjust_width   0x005278A4
    _hires_adjust_width   0x005278AE
    _hires_adjust_width   0x00527A4D
    _hires_adjust_width   0x00527A52

    ; power usage indicator
    _hires_adjust_width   0x00527C0F

    ; new missions dialog
    _hires_adjust_top     0x004BE7A5
    _hires_adjust_left    0x004BE7AA

    ; new missions list
    _hires_adjust_top     0x004BE3DD
    _hires_adjust_left    0x004BE3E7

    ; new missions 'Aftermath missions' caption
    _hires_adjust_top     0x004BE7D5
    _hires_adjust_left    0x004BE7DA

    ; new missions 'Counterstrike missions' caption
    _hires_adjust_top     0x004BE7BF
    _hires_adjust_left    0x004BE7C4

    ; screen shake
    _hires_adjust_width   0x004AB8A4
    _hires_adjust_width   0x004ABBFB

    _hires_adjust_width   0x004AB8C9
    _hires_adjust_width   0x004ABC1D


    ; win "Mission Accomplished" text
    _hires_adjust_left    0x0053B336
    _hires_adjust_top     0x0053B32E

    ; campaign win "Mission Accomplished" text
    _hires_adjust_left    0x0053AD49
    _hires_adjust_top     0x0053AD3F

    ; lose "The Game is a Draw" text

    _hires_adjust_left    0x0053B629
    _hires_adjust_top     0x0053B61E


    ;Lan New dialog
    ; Text print offsets
    _hires_adjust_left    0x0050B6F6
    _hires_adjust_left    0x0050B6FB
;    _hires_adjust_top     0x0050B731
;    _hires_adjust_top     0x0050B6F1

    ; Message box
    _hires_adjust_left    0x0050B745
    _hires_adjust_top     0x0050B79B
    _hires_adjust_top     0x0050B82D
    _hires_adjust_top     0x00506ABC


    ; Unit count text height
    _hires_adjust_top     0x0050B78C

    ; Tech level text height
    _hires_adjust_top     0x0050B791

    ; AI players text height
    _hires_adjust_top     0x0050B7CE

    ; Credits text
    _hires_adjust_top     0x0050B740

    ; Player + country box
    _hires_adjust_top     0x0050B84D
    _hires_adjust_left    0x0050B852

    ; map list box
    _hires_adjust_top     0x0050B886
    _hires_adjust_left    0x0050B88B

    ; Unit count slider
    _hires_adjust_top     0x0050B8CA
    _hires_adjust_left    0x0050B8CF

    ; Tech level slider
    _hires_adjust_top     0x0050B8E8
    _hires_adjust_left    0x0050B8ED

    ; Credits slider
    _hires_adjust_top     0x0050B906
    _hires_adjust_left    0x0050B90B

    ; AI players slider
    _hires_adjust_top     0x0050B924
    _hires_adjust_left    0x0050B929

    ; Game options box
    _hires_adjust_top     0x0050B95A
    _hires_adjust_left    0x0050B95F

    ; Load button
    _hires_adjust_top     0x0050B9A4
    _hires_adjust_left    0x0050B9B3

    ; Cancel button
    _hires_adjust_top     0x0050B9CD
    _hires_adjust_left    0x0050B9DC

    ; Unit count text
    _hires_adjust_top     0x0050B9F5
    _hires_adjust_left    0x0050B9FA

    ; Tech level number text
    _hires_adjust_top     0x0050BA1A
    _hires_adjust_left    0x0050BA29

    ; Credits count text
    _hires_adjust_top     0x0050BA3F
    _hires_adjust_left    0x0050BA4E

    ; AI players count text
    _hires_adjust_top     0x0050BA64
    _hires_adjust_left    0x0050BA73

    ; network new dialog
    ; Game channels box
    _hires_adjust_top     0x00506C74
    _hires_adjust_left    0x00506C7B

    ; Player list box
    _hires_adjust_top     0x00506CC1
    _hires_adjust_left    0x00506CC6

    ; network new button
    _hires_adjust_left    0x00506D43
    _hires_adjust_top     0x00506D34

    ; network cancel button
    _hires_adjust_left    0x00506D1A
    _hires_adjust_top     0x00506D0B

    ; Unit count slider
    _hires_adjust_top     0x00506D5A
    _hires_adjust_left    0x00506D5F

    ; Tech level slider
    _hires_adjust_top     0x00506D78
    _hires_adjust_left    0x00506D7D

    ; AI players slider
    _hires_adjust_top     0x00506DB1
    _hires_adjust_left    0x00506DB6

    ; Game options box
    _hires_adjust_top     0x00506DE7
    _hires_adjust_left    0x00506DEC

    ; Unit count text
    _hires_adjust_top     0x00506E2C
    _hires_adjust_left    0x00506E3B

    ; Tech level number text
    _hires_adjust_top     0x00506E51
    _hires_adjust_left    0x00506E60

    ; Credits count text
    _hires_adjust_top     0x00506E76
    _hires_adjust_left    0x00506E85

    ; AI players count text
    _hires_adjust_top     0x00506EA5
    _hires_adjust_left    0x00506EB5

    ; Message box
    _hires_adjust_left    0x00506A98
    _hires_adjust_top     0x005069B4
    _hires_adjust_top     0x00506AC9

    ; network new dialog
;    _hires_adjust_left    0x0050C28E
;    _hires_adjust_top     0x0050C288

    ; network join dialog
;    _hires_adjust_left    0x0050690B
;    _hires_adjust_top     0x00506BDD

    ;
;    _hires_adjust_top     0x00506C85
;    _hires_adjust_left    0x00506C79 ; pushes byte, need to jump..

    ; network new button
;    _hires_adjust_left    0x00506D43
;    _hires_adjust_top     0x00506D34

    ; network cancel button
;    _hires_adjust_left    0x00506D1A
;    _hires_adjust_top     0x00506D0B

    ; network join button
;    _hires_adjust_left    0x00506CF4
;    _hires_adjust_top     0x00506CE5

    ; network join colour list
;;    _hires_adjust_left    0x00506CCB ; disabled for now

    ; network join country drop list
;    _hires_adjust_left    0x00506C35

    ; network join players list
;    _hires_adjust_left    0x00506CC6
;    _hires_adjust_top     0x00506CC1

;    _hires_adjust_top     0x0050691F
;    _hires_adjust_left    0x00506AE6

    ; network text
;    _hires_adjust_left    0x0050C2C5 ; disabled for now
;    _hires_adjust_top     0x0050C2C1 ; disabled for now

    ; sidebar stuff
;    _hires_adjust_left    0x0054D7EC
;    _hires_adjust_left    0x0054D7F1

    ; kill original sidebar area (halp)
    mov  byte [0x0054F380], 0xC3

.Ret:
    pop  edx
    pop  ebx

    jmp  0x00552979

_Fill_Rect_test:

    mov  al, 0
    push eax
    mov  cx, 0     ; [ebp-0ACh]           ; top
    push cx                     ; __int16
    mov  ax, 0     ; [ebp-0B0h]           ; left
    push ax                     ; __int16
    mov  dx, 1000  ; [ebp-0B4h]
    push dx                     ; __int16
    mov  bx, 1500  ; [ebp-0B8h]
    push bx                     ; __int16
    mov  ebx, [BuffGlbl___LogicPage]
    push ebx
    jmp  0x00507B65


;_hires_MainMenuClearBackground:
;    int 3
;    mov al, 0
;    push    eax
;    mov     word ecx, 0 ; [ebp-0ACh] top
;    push    word ecx             ; __int16
;    mov     word eax, 0; [ebp-0B0h] ; left
;    push    word eax             ; __int16
;    mov     word edx, 1000 ; [ebp-0B4h]
;    push    word edx             ; __int16
;    mov     word ebx, 1500 ; [ebp-0B8h]
;    push    word ebx             ; __int16
;    mov        ebx, [GraphicsViewPortClass_HidPage] ; GraphicViewPortClass LogicPage
;    push    ebx
;    call    0x005C23F0
;    add     esp, 18h

;    mov     eax, 1
;    jmp        0x00502243

_hires_Power_Usage_Indicator_Height:
;    sub        ecx, [diff_height]
    cmp  ecx, 0x186
    jge  .No_Draw
;    cmp        ecx, 0x186
;    je        .Adjust_Height
    jmp  .Ret

.No_Draw:
    jmp  0x00527C23


;.Adjust_Height:
;    sub    ecx, 46

.Ret:
    mov  eax, [0x006877B8]
    call Conquer___CC_Draw_Shape
    jmp  0x00527C23

_hires_Deinterlace_Videos_Always_Deinterlace:
    mov  eax, ebx
    call 0x005B2CE0 ; Read_Interpolation_Palette(char *)

    cmp  dword [0x00691730], 0
    jz   .Jump_Over_Create_Table
    call 0x005B2DD0 ; Create_Palette_Interpolation_Table(void)

.Jump_Over_Create_Table:
    mov  eax, ebx
    call 0x005B3009 ; Write_Interpolation_Palette(char *)

    jmp  0x005B300E

_hires_Deinterlace_Videos_Fix_Bottom_Line:
    jmp  0x005E5498

_hires_Deinterlace_Videos:
;    mov     eax, 2 ; video mode, 2 = deinterlace
    mov  eax, [RedAlert.Options.VideoInterlaceMode]
    jmp  0x005B30D5

;_hires_Deinterlace_Videos2:
;    jmp     0x005B304A

_hires_Videos:
    mov  ecx, 100h
    mov  ebx, 100h
;    mov     edx, [ScreenWidth]
;    mov     ebx, [ScreenHeight]
    jmp  0x004A8C77

_hires_Videos2:
;    mov     edx, 0
;    mov     ebx, 0

    mov  eax, 0C8h
    mov  edi, 140h
    jmp  0x004A8AD0

_hires_MainMenu_Credits_Select:
;    cmp dword [ScreenHeight], 480
;    jz    .No_Change

    mov  edx, 30h ; left
    add  edx, [diff_top]
    push edx

;    push    30h             ; int
    mov  ecx, 14h
    add  ecx, [diff_top]

    mov  eax, [Globals___Keyboard]

    mov  ebx, 12h
    add  ebx, [diff_left]

    mov  edx, 9Eh
    add  edx, [diff_left]
    push edx
;    push    9Eh             ; int

    jmp  0x005024C5

.No_Change:
    push 30h
    mov  ecx, 14h
    jmp  0x005024B6

_hires_MainMenu_AntMissions_Select:
;    cmp dword [ScreenHeight], 480
;    jz    .No_Change

    mov  eax, 64h ; left
    add  eax, [diff_top]
    push eax
;    push    64h             ; int

    mov  ebx, 208h
    add  ebx, [diff_left]

    mov  eax, [Globals___Keyboard]

    xor  ecx, ecx
    add  ecx, [diff_top]

    mov  edx, 280h
    add  edx, [diff_left]
    push edx

    jmp  0x0050254D

.No_Change:
    push 64h
    mov  ebx, 208h
    jmp  0x00502541

_hires_Network_Join_Fill_ColorBoxes:
    mov  ebx, edi
    imul ebx, 5
    add  ebx, 1
    add  ebx, 1A4h
    add  ebx, [diff_top]
    jmp  0x00507C13

_hires_Network_Join_ColorBoxes:
    mov  edx, [ebp-80h] ; top
;    add        edx, [diff_top]
    mov  eax, [edi+ebp-264h] ; left
    add  eax, [diff_left]
    jmp  0x00507BBB

_hires_Network_Join_ColorBoxes2:
    mov  edx, [ebp-80h] ; top
;    add        edx, [diff_top]
    mov  eax, [edi+ebp-264h] ; left
    add  eax, [diff_left]
    jmp  0x00507BDC

_hires_Network_Join_DrawBox:
    mov  edx, [ebp-148h] ; top
    add  edx, [diff_top]
    mov  eax, [ebp-14Ch] ; left
    add  eax, [diff_left]
    jmp  0x00507DFB

_hires_Network_Join_DrawBox2:
    mov  edx, [ebp-128h] ; top
    add  edx, [diff_top]
    mov  eax, [ebp-12Ch] ; left
    add  eax, [diff_left]
    jmp  0x00507E1C

_hires_Network_Join_ChatBox:
    mov  eax, 73h
    add  eax, [diff_top]
    push eax

;    push    73h
;    push    14h

    mov  eax, 14h
    add  eax, [diff_left]
    push eax

    mov  eax, [ebp-128h]
    jmp  0x00507229

_hires_Network_Channel:
    mov  ecx, 43h ; top
    add  ecx, [diff_top]

    push 4Eh

    mov  ebx, 1Eh ; left
    add  ebx, [diff_left]

    mov  edx, 66h

    push 136h

    jmp  0x00506C89

_hires_Network_Country_DropList:
    push eax
    push 50h
    push 78h

    mov  ecx, 1Fh
    add  ecx, [diff_top]
    push ecx
;    push    1Fh

    jmp  0x00506C34

_hires_Network_Name_EditBox:

    mov  eax, 1Fh
    add  eax, [diff_top]
    push eax

    mov  eax, 0x00601694
    xor  dh, dh

;    push    5Ah             ; __int32
    mov  edx, 5Ah
    add  edx, [diff_left]
    push edx

    mov  [ebp-100h], eax
    mov  byte [0x0067F2D6], dh

    push 16h

    jmp  0x00506BF5

_hires_Network_Color_List:
    push 16h

    mov  ecx, 42h
    add  ecx, [diff_top]
    push ecx

    mov  ecx, 43h
    jmp  0x00506CC5

_hires_Network_Join_Button:
    mov  ebx, 0C0h

    mov  edx, 42h
    add  edx, [diff_left]
    push edx

    mov  edx, 68h
    jmp  0x00506CFA

_hires_StripClass:
    mov  dword [ebx+0x104F], 0x1F0 ; left strip offset left
    mov  dword [ebx+0x1053], 0x0B4 ; left strip offset top
    mov  dword [ebx+0x132F], 0x0B4 ; right strip offset top
    mov  dword [ebx+0x132B], 0x236 ; right strip offset left

    lea  eax, [ebx+0x104F]
    mov  [left_strip_offset], eax
    lea  eax, [ebx+0x132B]
    mov  [right_strip_offset], eax

    mov  eax,ebx
    jmp  0x0054D033

_hires_MainMenu:
;    cmp dword [ScreenHeight], 480
;    jz    .No_Change

    mov  ebx, [diff_top]
    mov  eax, [diff_left]
    cmp  byte [scorebackground], 1
    je   .Display_Top_Left

    cmp  edx, 190h
    je   .Jump_Background_Skip

.Display_Top_Left:
    mov  ebx, 0
    mov  eax, 0

.Jump_Background_Skip:
    mov  byte [scorebackground], 0
    push ebx
    push eax
    push 0
    push 0
    jmp  0x005B3DC7

.No_Change:
    push 0
    push 0
    push 0
    push 0
    jmp  0x005B3DC7

_hires_Intro:
    push 0
    push 0

    mov  eax, 100
    ; mov eax, [diff_top]
    push eax
    mov  eax, 100
;    mov eax, [diff_left]
    push eax

    jmp  0x004A9EB1

_hires_NewGameText_top  dd 0x96
_hires_NewGameText_left dd 0x6E

_hires_NewGameText:
    mov  eax, [diff_top]
    add  eax,0x96
    push eax

    mov  eax, [diff_left]
    add  eax,0x6E
    push eax

    jmp  0x005518AA

_hires_SkirmishMenu:
    mov  ecx, [diff_left]
    mov  dword [ebp-0x1D4], ecx
    mov  ecx, [diff_top]
    mov  dword [ebp-0x1D0], ecx

    xor  ecx,ecx
    jmp  0x005128E0

.No_Change:
    mov  dword [ebp-0x1D4], ecx
    jmp  0x005128DA

_hires_NetworkJoinMenu:
    mov  ecx, [diff_top]
    mov  dword [ebp-0x1D4], ecx
    mov  ecx, [diff_left]
    mov  dword [ebp-0x1D0], ecx
    xor  ecx,ecx
    jmp  0x0050693D

_hires_MainMenuClear:
    hires_Clear
    mov  eax,1
    jmp  0x004F47A0

_hires_MainMenuClearPalette:
    hires_Clear
    mov  eax, [0x006807E8]
    jmp  0x004F7600

_Blacken_Screen_Border_Menu:
    call 0x005C9E60
    mov  eax, 1

    jmp  0x00502243

_Blacken_Screen_Border_Menu2:
    hires_Clear_2
    mov  eax, 1

    jmp  0x00502293

_NewMissions_Handle_Hires_Buttons_A:
;    cmp dword [ScreenHeight], 480
;    jz    .No_Change

    mov  edx, 13Ch
    add  edx, [diff_top]
    push edx

    mov  ecx, 116h
    mov  ebx, 17h

    mov  edx, 50h
    add  edx, [diff_left]
    push edx

    jmp  0x004BE388

.No_Change:
    push 13Ch
    jmp  0x004BE37C

_NewMissions_Handle_Hires_Buttons_B:
;    cmp dword [ScreenHeight], 480
;    jz    .No_Change

    mov  edx, 13Ch
    add  edx, [diff_top]
    push edx

    mov  ecx, 116h
    mov  ebx, 13h

    mov  edx, 203h
    add  edx, [diff_left]
    push edx

    jmp  0x004BE3B2

.No_Change:
    push 13Ch
    jmp  0x004BE3A3

_hires_Net_New_Dialog:
    mov  ecx, [diff_left]
    mov  [ebp-0xFC], ecx
    mov  ecx, [diff_top]
    mov  [ebp-0xF8], ecx
    jmp  0x0050B719

_hires_Net_New_Dialog2:
    mov  edx, 0x75
    add  edx, [diff_top]
    push edx

    mov  edx, 0x63
    add  edx, [diff_left]
    push edx
    mov  ecx, 0x116
    mov  ebx, 0x0D8
    jmp  0x0050B8B7

_hires_Net_New_Dialog_OK_Button:
    mov  edx, 0x16e
    add  edx, [diff_top]
    push edx

    mov  edx, 0x38
    add  edx, [diff_left]
    push edx

    mov  ecx, 0x116
    mov  ebx, 0x17
    jmp  0x0050B98E

_hires_Net_New_Players_Text_Print:
;    0x10 and 0x9a
    mov  eax, 0x10
    add  eax, [diff_top]
    push eax
    mov  edx, 0x9a
    add  edx, [diff_left]
    push edx
    jmp  0x0050C2AB


_hires_Net_New_Scenario_Text_Print:
; 0x10 and 0x000001C0
    mov  ecx, 0x10
    add  ecx, [diff_top]
    push ecx
    mov  esi, 0x1C0
    add  esi, [diff_left]
    push esi
    jmp  0x0050C2C8

_hires_Net_New_Unit_Count_Text_Print:
; 0x00000087 and 0x000000BE
    mov  eax, 0x87
    add  eax, [diff_top]
    push eax
    mov  edx, 0xBE
    add  edx, [diff_left]
    push edx
    jmp  0x0050C2E8

_hires_Net_New_Tech_Level_Text_Print:
; 0x00000094 and 0xBE
    mov  ecx, 0x94
    add  ecx, [diff_top]
    push ecx
    mov  esi, 0xBE
    add  esi, [diff_left]
    push esi
    jmp  0x0050C308

_hires_Net_New_Credits_Text_Print:
; 0x000000A1 and 000000BE
    mov  eax, 0xA1
    add  eax, [diff_top]
    push eax
    mov  edx, 0xBE
    add  edx, [diff_left]
    push edx
    jmp  0x0050C328

_hires_Net_New_AI_Players_Text_Print:
; 0x000000AE and 000000BE
    mov  ecx, 0xAE
    add  ecx, [diff_top]
    push ecx
    mov  esi, 0xBE
    add  esi, [diff_left]
    push esi
    jmp  0x0050C348

_hires_Net_Join_Dialog:
; left = 1d4 and top = 1d0
    mov  ecx, [diff_left]
    mov  [ebp-0x1d4], ecx
    mov  ecx, [diff_top]
    mov  [ebp-0x1d0], ecx
    jmp  0x0050693D

_hires_Net_Join_Name_Box:
    mov  eax, 0x1f
    add  eax, [diff_top]
    push eax

    mov  eax, 0x5a
    add  eax, [diff_left]
    push eax

    mov  eax,dword [0x601694]
    xor  DH,DH
    jmp  0x00506BE7

_hires_Net_Join_Country_Box:
    mov  ecx, 0x1F
    add  ecx, [diff_top]
    push ecx

    mov  ecx, 0x104
    add  ecx, [diff_left]
    push ecx
    jmp  0x00506C39

_hires_Net_Join_Join_Button:

    mov  ecx, 0x16E
    add  ecx, [diff_top]
    push ecx

    mov  ecx, 0x42
    add  ecx, [diff_left]
    push ecx
    mov  ecx, 116h
    mov  ebx, 0C0h
    jmp  0x00506CF5

_hires_Net_Join_Credits_Slider:
    mov  ecx, 0B9h
    add  ecx, [diff_top]
    mov  ebx, 0B9h
    add  ebx, [diff_left]
    call GaugeClass__GaugeClass
    jmp  0x00506DAE

_hires_Net_Join_Static_Button:
    mov  eax, 0x1f
    add  eax, [diff_top]
    push eax

    mov  eax, 0x20
    add  eax, [diff_left]
    push eax

    mov  ecx, 116h
    mov  ebx, 0x005EC269
    jmp  0x00506E1A

_hires_Net_Join_Games_Text_Print:
    mov  ebx, 0x36
    add  ebx, [diff_top]
    push ebx
    mov  ecx, 0xB9
    add  ecx, [diff_left]
    push ecx
    jmp  0x00507736

_hires_Net_Join_Players_Text_Print:
    mov  edi, 0x36
    add  edi, [diff_top]
    push edi
    mov  eax, 0x1EC
    add  eax, [diff_left]
    push eax
    jmp  0x00507759

;esi = 12, edi = a0
_hires_Net_Join_Name_Text_Print:
    mov  esi, 0x12
    add  esi, [diff_top]
    push esi
    mov  edi, 0xa0
    add  edi, [diff_left]
    push edi
    jmp  0x0050778A

;edx = 12, ebx =140
_hires_Net_Join_Side_Text_Print:
    mov  edx, 0x12
    add  edx, [diff_top]
    push edx
    mov  ebx, 0x140
    add  ebx, [diff_left]
    push ebx
    jmp  0x005077AD

;esi = 12, edi = 230
_hires_Net_Join_Color_Text_Print:
    mov  esi, 0x12
    add  esi, [diff_top]
    push esi
    mov  edi, 0x1f0
    add  edi, [diff_left]
    push edi
    jmp  0x005077D0

;ecx = 30, eax = 1b5, 1C9, 1DD
_hires_Net_Join_Color_Draw_Colored_Rectangles:
    mov  ecx, [ebp-0xAC] ; top
    add  ecx, [diff_top]
    push ecx             ; __int16
    mov  eax, [ebp-0xB0] ; left
    add  eax, [diff_left]
    push eax             ; __int16
    mov  edx, [ebp-0xB4] ; height
    add  edx, [diff_top]
    push edx             ; __int16
    mov  ebx, [ebp-0xB8] ; width
    add  ebx, [diff_left]
    push ebx             ; __int16
    jmp  0x00507B64

_hires_Net_Join_Color_Draw_Boxes:
    add  edx, [diff_top]
    add  eax, [diff_left]
    call Dialog___Draw_Box
    jmp  0x00507BC0

_hires_Net_Join_Color_Draw_Boxes2:
    add  edx, [diff_top]
    add  eax, [diff_left]
    call Dialog___Draw_Box
    jmp  0x00507BE1

_hires_Net_Join_Color_Box_Select_Thingy:
    mov  edi, [ebp-0x80]
    add  edi, [diff_top]
    mov  eax, [edx+4]
    cmp  eax, edi
    jle  0x00508193
    mov  ecx, [ebp-0x84]
    add  ecx, [diff_top]
    cmp  eax, ecx
    jmp  0x0050855F

_hires_Net_Join_Color_Box_Select_Thingy2:
    mov  ebx, [ebp-0x264]
    add  ebx, [diff_left]
    cmp  ebx, [edx]
    jge  0x00508193
    mov  eax, [ebp-0x248]
    mov  ecx, [ebp-0x1A8]
    add  eax, [diff_left]
    jmp  0x0050853F

_hires_Net_Join_Color_Box_Select_Thingy3:
    mov  ecx, [ebp-0x264]
    add  ecx, [diff_left]
    jmp  0x0050856B

_hires_Net_Join_MessageBox:
; 00507DFB
;edx = 00000102 eax = 6E
;    cmp        eax,
    add  edx, [diff_top]
    call Dialog___Draw_Box
    jmp  0x00507E00

_hires_Net_Join_Unit_Count_Text_Print:
; ecx = 0000009F, esi = 000000B5
    mov  ecx, 0x9F
    add  ecx, [diff_top]
    push ecx
    mov  esi, 0xB5
    add  esi, [diff_left]
    jmp  0x00507F40

; edx= 000000AC, ebx = 000000B5
_hires_Net_Join_Tech_Level_Text_Print:
    mov  edx, 0xAC
    add  edx, [diff_top]
    push edx
    mov  ebx, 0xB5
    add  ebx, [diff_left]
    jmp  0x00507FA4

; eax = 000000B9, edx = B5
_hires_Net_Join_Credits_Text_Print:
    mov  eax, 0xB9
    add  eax, [diff_top]
    push eax
    mov  edx, 0xB5
    add  edx, [diff_left]
    jmp  0x00508023

; esi = 000000C6, edi = b5
_hires_Net_Join_AI_Players_Text_Print:
    mov  esi, 0xC6
    add  esi, [diff_top]
    push esi
    mov  edi, 0xB5
    add  edi, [diff_left]
    jmp  0x00508081

_hires_Net_Join_Playing_As_Text_Print:
; edx = 00000010, ebx = 00000140
    mov  edx, 0x10
    add  edx, [diff_top]
    push edx
    mov  ebx, 0x140
    add  ebx, [diff_left]
    jmp  0x00507894

_Shake_The_Screen_Height2:
    mov  eax, [ScreenHeight]
    sub  eax, 2
    jmp  0x004ABBE4

_Shake_The_Screen_Height1:
    mov  eax, [ScreenHeight]
    sub  eax, 2
    jmp  0x004AB8AD

_Set_Screen_Height_400_NOP:
    cmp  dword [fake480height], 1
    je   .No_Change

    jmp  0x00552628

.No_Change:
    mov  dword [ScreenHeight], 190h
    jmp  0x005525ED

_No_Black_Bars_In_640x480:
    cmp  dword [fake480height], 1
    je   .No_Change
    jmp  0x00552628

.No_Change:
    jmp  0x005525ED

_Set_Screen_Height_480_NOP:
    mov  dword [ScreenHeight], ebx
    mov  dword [fake480height], 1
    jmp  0x005523EE
