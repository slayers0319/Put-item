#Include function.ahk
#Include rw_settings.ahk
#Include GUI.ahk

#SingleInstance force
#NoEnv ; Recommended for performance and compatibility with future AutoHotkey releases.
#Persistent ; Stay open in background
#MaxThreadsPerHotkey 2

;------------Declare-----------------------------------------------
global resolutionX
global resolutiony
global Mod1
global Mod2
global Mod3
global Mod4
global StorageSpeed


;global  StorageSpeed := 35      ;MilliSecond
/*
global goalfixx := "機率吸引來自超越的怪物"
global goalfixxx := "嚴密的"
global goalfixxxx := "嚴密的"
global goalfixxxxx := "嚴密的"
global prefix := "前綴"
*/

global prefix := "前綴"

global SoundVolume := 0
global soundg := "g.wav"

global  Fixorigin  :=  [1298, 613]    ;[X_origin,Y_origin]
global  Fixoffset  :=  52.5           ;move distance
global  speed   :=  35             ;GlobalSecond

global  origin  :=  [1298, 613]    ;[X_origin,Y_origin]
global  offset  :=  52.5           ;move distance

global  FixCurrentPage         := [333, 440]   ;通貨頁裝備
global  FixOrbofAlchemy        := [485, 255]   ;點金石
global  FixOrbOfbinding        := [175, 515]   ;束縛石
global  FixOrbOfScouring       := [115, 440]   ;重鑄石
global  FixOrbOfChance         := [230, 260]   ;機會石
global  FixOrbOfAlteration     := [115, 260]   ;改造石
global  FixOrbOfAugmentation   := [235, 315]   ;增幅石
global  FixGetProphecy         := [335, 775]   ;取得預言
global  FixSeal                := [427, 612]   ;封印預言
global  FixScrollOfWisdom      := [115, 185]

global  CurrentPage         := [333, 440]   ;通貨頁裝備
global  OrbofAlchemy        := [485, 255]   ;點金石
global  OrbOfbinding        := [175, 515]   ;束縛石
global  OrbOfScouring       := [115, 440]   ;重鑄石
global  OrbOfChance         := [230, 260]   ;機會石
global  OrbOfAlteration     := [115, 260]   ;改造石
global  OrbOfAugmentation   := [235, 315]   ;增幅石
global  GetProphecy         := [335, 775]   ;取得預言
global  Seal                := [427, 612]   ;封印預言
global  ScrollOfWisdom      := [115, 185]

global ResolutionRatio := 1

;------------ReadSetting-----------------------------------------------
ReadSettings()
ChangeResolution()
RunGUI()

$f10::  ;show GUI
    Gui Show, w544 h351, Put item v2.0
Return

#IfWinActive, Path of Exile

    $f3::move(origin[1], origin[2])

    $f5::Coord()

    $f7::Binding(CurrentPage, OrbOfScouring, OrbOfbinding)

    $f6::look(origin[1], origin[2])

    $f8::Prophecy(GetProphecy, Seal, origin)

    $f9::DestroyProphecy()

    $f2::Chance()

    $f12::Alteration()

    ; $f1::test(ResolutionRatio)

    ; Esc::ExitApp
return