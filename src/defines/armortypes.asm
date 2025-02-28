;----------------------------------------------------------------
; src/defines/armortypes.asm
;
; ArmorType Definitions
;   ArmorType represent a set of armors used to modify incoming damage based on Warhead.
;   Used for damage calculus.
;
;   Red Alert originally supports 5 types. This file allows more types to be used.
;
;----------------------------------------------------------------

; Base ArmorTypes
str.ArmorType.None            db"none",0
str.ArmorType.Wood            db"wood",0
str.ArmorType.Light           db"light",0
str.ArmorType.Heavy           db"heavy",0
str.ArmorType.Concrete        db"concrete",0
; new ArmorTypes names, inspired from RA2. Beware that they are added after the original and the order of armor types does not match that of RA2
str.ArmorType.Flak            db"flak",0
str.ArmorType.Plate           db"plate",0
str.ArmorType.Medium          db"medium",0
str.ArmorType.Steel           db"steel",0
; unimplemented ArmorTypes. On implementation of expansion to the warheadtype class memory size, additional armor types can be implemented to match RA2
str.ArmorType.Special_1       db"special_1",0
str.ArmorType.Special_2       db"special_2",0

strlist.ArmorTypes            dd str.ArmorType.None,str.ArmorType.Wood,str.ArmorType.Light,str.ArmorType.Heavy,str.ArmorType.Concrete,str.ArmorType.Flak,str.ArmorType.Plate,str.ArmorType.Medium,str.ArmorType.Steel,str.ArmorType.Special_1,str.ArmorType.Special_2,0

str.ArmorDefault              db"100%%,100%%,100%%,100%%,100%%,100%%,100%%,100%%,100%%",0

%assign ArmorType.None        0
%assign ArmorType.Wood        1
%assign ArmorType.Light       2
%assign ArmorType.Heavy       3
%assign ArmorType.Concrete    4
%assign ArmorType.Flak        5
%assign ArmorType.Plate       6
%assign ArmorType.Medium      7
%assign ArmorType.Steel       8
%assign ArmorType.Special_1   9
%assign ArmorType.Special_2   10