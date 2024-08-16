RunGUI(){

;-----------Title-------------------------------------
Gui Font, s20, Calibri
Gui Add, Text, x8 y8 w154 h23 +0x200, Put item v2.3
Gui Font
;-----------Craft-------------------------------------
Gui Font, s16, Calibri
Gui Add, GroupBox, x8 y40 w217 h227, Craft
Gui Font
Gui Font, s12, 微軟正黑體
Gui Add, DropDownList,vprefix x16 y72 w199, 前綴||後綴
Gui Font
Gui Font, s14, Calibri
Gui Add, Text, x16 y104 w120 h23 +0x200, target
Gui Font
Gui Font, s10, Calibri
Gui Add, Text, x16 y136 w37 h23 +0x200, Mod 1
Gui Add, Text, x16 y168 w37 h23 +0x200, Mod 2
Gui Add, Text, x16 y200 w37 h23 +0x200, Mod 3
Gui Add, Text, x16 y232 w37 h23 +0x200, Mod 4
Gui Add, Text, x16 y264 w37 h23 +0x200, Mod 5
Gui Add, Text, x16 y296 w37 h23 +0x200, Mod 6
Gui Font
Gui Font, s10, 微軟正黑體
Gui Add, Edit, vMod1 x56 y136 w157 h24, %Mod1%
Gui Add, Edit, vMod2 x56 y168 w157 h24, %Mod2%
Gui Add, Edit, vMod3 x56 y200 w157 h24, %Mod3%
Gui Add, Edit, vMod4 x56 y232 w157 h24, %Mod4%
Gui Add, Edit, vMod5 x56 y264 w157 h24, %Mod5%
Gui Add, Edit, vMod6 x56 y296 w157 h24, %Mod6%
Gui Font
;-----------Speed-------------------------------------
Gui Font, s16, Calibri
Gui Add, GroupBox, x8 y328 w219 h80, Speed
Gui Font
Gui Font, s12, Calibri
Gui Add, Text, x16 y360 w98 h20 +0x200, Storage Speed
Gui Add, Text, x16 y384 w99 h21 +0x200, Global Speed
Gui Font
Gui Font, s11, Calibri
Gui Add, Edit, vStorageSpeed x120 y360 w48 h19, %StorageSpeed%
Gui Add, Edit, vspeed x120 y384 w48 h19, %speed%
Gui Font
;-----------HotkeyList-------------------------------------
Gui Font, s16, Calibri
Gui Add, GroupBox, x232 y40 w159 h303, HotkeyList
Gui Font
Gui Font, s12, 微軟正黑體
; Gui Add, Text, x240 y72 w70 h23 +0x200, 機會重鑄
Gui Add, Text, x240 y104 w70 h23 +0x200, 儲倉
Gui Add, Text, x240 y136 w70 h23 +0x200, 停止動作
Gui Add, Text, x240 y168 w111 h23 +0x200, 顯示滑鼠座標
; Gui Add, Text, x240 y200 w70 h23 +0x200, 尋求預言
; Gui Add, Text, x240 y232 w70 h23 +0x200, 摧毀物品
Gui Add, Text, x240 y264 w70 h23 +0x200, 改造增幅
Gui Add, Text, x240 y296 w70 h23 +0x200, GUI視窗
; Gui Add, Text, x352 y72 w24 h23 +0x200, F2
Gui Add, Text, x352 y104 w24 h23 +0x200, F3
Gui Add, Text, x352 y136 w24 h23 +0x200, F4
Gui Add, Text, x352 y168 w24 h23 +0x200, F5
; Gui Add, Text, x352 y200 w24 h23 +0x200, F8
; Gui Add, Text, x352 y232 w24 h23 +0x200, F9
Gui Add, Text, x352 y264 w28 h23 +0x200, F12
Gui Add, Text, x352 y296 w28 h23 +0x200, F10
Gui Font
;-----------Resolution-------------------------------------
Gui Font, s16, Calibri
Gui Add, GroupBox, x400 y40 w147 h80, Resolution
Gui Add, Text, x465 y83 w13 h22 +0x200, x
Gui Add, Edit, vresolutionX x408 y80 w52 h29, %resolutionX%
Gui Add, Edit, vresolutionY x480 y80 w54 h29, %resolutionY%
Gui Add, Button, x400 y304 w133 h39, &Apply


Gui Show, w544 h415, Put item v2.3
Return

GuiEscape:
GuiClose:
    SaveSettings()
    ExitApp
}

ButtonApply(){
    Gui, Submit
    ChangeResolution()
    SaveSettings()
    MsgBox , 0, , change applied
}

