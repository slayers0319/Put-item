test(aa)
{
    a:=origin[1]
    b:=origin[2]
    MsgBox %aa%--%a%--%b%--%resolutionX%--%ResolutionRatio%

}

ChangeResolution(){
    ResolutionRatio := resolutionX/1920

    offset := Fixoffset*ResolutionRatio
    origin[1] := Fixorigin[1]*ResolutionRatio
    origin[2] := Fixorigin[2]*ResolutionRatio
    CurrentPage[1] := FixCurrentPage[1]*ResolutionRatio
    CurrentPage[2] := FixCurrentPage[2]*ResolutionRatio
    OrbofAlchemy[1] := FixOrbofAlchemy[1]*ResolutionRatio
    OrbofAlchemy[2] := FixOrbofAlchemy[2]*ResolutionRatio
    OrbOfbinding[1] := FixOrbOfbinding[1]*ResolutionRatio
    OrbOfbinding[2] := FixOrbOfbinding[2]*ResolutionRatio
    OrbOfScouring[1] := FixOrbOfScouring[1]*ResolutionRatio
    OrbOfScouring[2] := FixOrbOfScouring[2]*ResolutionRatio
    OrbOfChance[1] := FixOrbOfChance[1]*ResolutionRatio
    OrbOfChance[2] := FixOrbOfChance[2]*ResolutionRatio
    OrbOfAlteration[1] := FixOrbOfAlteration[1]*ResolutionRatio
    OrbOfAlteration[2] := FixOrbOfAlteration[2]*ResolutionRatio
    OrbOfAugmentation[1] := FixOrbOfAugmentation[1]*ResolutionRatio
    OrbOfAugmentation[2] := FixOrbOfAugmentation[2]*ResolutionRatio
    GetProphecy[1] := FixGetProphecy[1]*ResolutionRatio
    GetProphecy[2] := FixGetProphecy[2]*ResolutionRatio
    Seal[1] := FixSeal[1]*ResolutionRatio
    Seal[2] := FixSeal[2]*ResolutionRatio
    ScrollOfWisdom[1] := FixScrollOfWisdom[1]*ResolutionRatio
    ScrollOfWisdom[2] := FixScrollOfWisdom[2]*ResolutionRatio
}

Coord()
{
    CoordMode, Mouse, Screen   ;;;將滑鼠的座標系統對應到螢幕上
    loop,{
        if( GetKeyState("f5" , "P") ){
            MouseGetPos, xpos, ypos,,,1
            ToolTip X%xpos% Y%ypos%
            SetTimer, RemoveToolTip, 1000
        }
        else{
            RemoveToolTip:
            SetTimer, RemoveToolTip, Off
            ToolTip
            Break
        }
    }
}


move(inputx,inputy)
{
    x := inputx
    y := inputy
    Send, {LCtrl Down}
    loop 12
    {
        Loop 5
        {   
            if( GetKeyState("f4" , "P") ){
                break
            }
                MouseMove, %x%, %y% ,0
                sleep StorageSpeed
                click, left
                if( (y >= inputy+offset*3) And (x < inputx+offset*2) ){
                    Break
                }
                y := y + offset
        }
    x := x + offset
    y := inputy
    }
    Send, {LCtrl up}
}


btn(k)
{
    sleep StorageSpeed
    send {%k% down}
    sleep StorageSpeed/5
    send {%k% up}
}


Binding(CurrentPage, OrbOfScouring, OrbOfbinding)
{
    MouseMove, OrbOfScouring[1], OrbOfScouring[2] ,1
    sleep speed/2
    btn("RButton")
    MouseMove, CurrentPage[1], CurrentPage[2] ,1
    sleep speed/2
    btn("LButton")
    MouseMove, OrbOfbinding[1], OrbOfbinding[2] ,1
    sleep speed/2
    btn("RButton")
    MouseMove, CurrentPage[1], CurrentPage[2] ,1
    sleep speed/2
    btn("LButton")
}

Alchemy(CurrentPage, OrbOfScouring, OrbOfbinding)
{
    MouseMove, OrbOfScouring[1], OrbOfScouring[2] ,1
    sleep speed/2
    btn("RButton")
    MouseMove, CurrentPage[1], CurrentPage[2] ,1
    sleep speed/2
    btn("LButton")
    MouseMove, OrbofAlchemy[1], OrbofAlchemy[2] ,1
    sleep speed/2
    btn("RButton")
    MouseMove, CurrentPage[1], CurrentPage[2] ,1
    sleep speed/2
    btn("LButton")
}

Prophecy(GetProphecy, Seal, origin)
{
    MouseMove, GetProphecy[1], GetProphecy[2] ,1
    sleep speed
    btn("LButton")
    MouseMove, Seal[1], Seal[2] ,3
    sleep speed
    btn("LButton")
    sleep speed
    SendInput, {Enter}
    sleep speed
    MouseMove, origin[1], origin[2] ,2
    sleep speed
    btn("LButton")
}

DestroyProphecy()
{
    btn("LButton")
    SendInput, {Enter}
    Clipboard = /destroy
    Send ^v 
    SendInput, {Enter}
}

Chance()
{
    Loop 500{
        if( GetKeyState("f4" , "P") ){
            break
        }
        MouseMove, OrbOfScouring[1], OrbOfScouring[2] ,1
        sleep speed/2
        btn("RButton")
        if( GetKeyState("f4" , "P") ){
            break
        }
        MouseMove, CurrentPage[1], CurrentPage[2] ,1
        sleep speed/2
        btn("LButton")
        if( GetKeyState("f4" , "P") ){
            break
        }
        MouseMove, OrbOfChance[1], OrbOfChance[2] ,1
        sleep speed/2
        btn("RButton")
        if( GetKeyState("f4" , "P") ){
            break
        }
        MouseMove, CurrentPage[1], CurrentPage[2] ,1
        sleep speed/2
        btn("LButton")
    }
}

look(inputx,inputy){
    x := inputx
    y := inputy
    MouseMove, ScrollOfWisdom[1], ScrollOfWisdom[2] ,1
    btn("RButton")
    Send, {LShift Down}

    loop 12
    {
        Loop 5
        {   
            if( GetKeyState("f4" , "P") ){
                break
            }
                MouseMove, %x%, %y% ,0
                btn("Click")
                if( (y >= inputy+offset*3) And (x < inputx+offset*2) ){
                    Break
                }
                y := y + offset
        }
    x := x + offset
    y := inputy
    }
    
    Send, {LShift up}
}

Alteration(){
    flag:=1
    MouseMove, CurrentPage[1], CurrentPage[2] ,1
    Send ^!c
    sleep speed
    Send ^!c
    sleep speed
    Send ^!c
    Loop 2000{
        if( GetKeyState("f4" , "P") ){
            Send, {LShift Up}
            Send, {Ctrl Up}
            Send, {Alt Up}
            Send, {c Up}
            return
        }
        if stop(){  ;success
            Send, {LShift Up}
            Send, {Ctrl Up}
            Send, {Alt Up}
            Send, {c Up}
            return
        }else{
            if(flag){
                Send, {LShift Down}
                handAlteration()    ;點改造
                flag:=0
                ;MsgBox, -----%flag%
            }else{
                Send, {LShift Down}
                MouseMove, CurrentPage[1], CurrentPage[2] ,1
                sleep speed*2
                click, left
                ;MsgBox, %flag%-----
            }
            sleep speed
            if havepre(){   ;有前綴?
                MouseMove, CurrentPage[1], CurrentPage[2] ,1
                Continue
            }else{
                flag:=1
                Send, {LShift Up}
                handAugmentation()  ;點增幅
                sleep speed
            }
            MouseMove, CurrentPage[1], CurrentPage[2] ,1
        }
    }
    SoundPlay, %soundg%
    sleep 500
    SoundPlay, %soundg%
}

copy(){
    Send, !^C
}

havepre(){
    copy()
    sleep 10
    copy()
    sleep 10
    copy()
    sleep 10
    copy()
    sleep 10
    copy()
    clipboardd = %Clipboard%
    IfInString clipboardd, %prefix%
    {
        return 1
    }
    return 0
}


stop(){
    copy()
    sleep 10
    copy()
    sleep 10
    copy()
    sleep 10
    copy()
    sleep 10
    copy()
    clipboardd = %Clipboard%

    IfInString clipboardd, %Mod1%
    {
        SoundSet, -%SoundVolume%
        SoundPlay, %soundg%
        MsgBox, %Mod1% The string was found.
        SoundSet, +%SoundVolume%

        Send, {LShift Up}
        Send, {Ctrl Up}
        Send, {Alt Up}
        return 1
    }

    IfInString clipboardd, %Mod2%
    {
        SoundSet, -%SoundVolume%
        SoundPlay, %soundg%
        MsgBox, %Mod2% The string was found.
        SoundSet, +%SoundVolume%

        Send, {LShift Up}
        Send, {Ctrl Up}
        Send, {Alt Up}
        return 1
    }

    IfInString clipboardd, %Mod3%
    {
        SoundSet, -%SoundVolume%
        SoundPlay, %soundg%
        MsgBox, %Mod3% The string was found.
        SoundSet, +%SoundVolume%
                
        Send, {LShift Up}
        Send, {Ctrl Up}
        Send, {Alt Up}
        return 1
    }

    IfInString clipboardd, %Mod4%
    {
        SoundSet, -%SoundVolume%
        SoundPlay, %soundg%
        MsgBox, %Mod4% The string was found.
        SoundSet, +%SoundVolume%
                
        Send, {LShift Up}
        Send, {Ctrl Up}
        Send, {Alt Up}
        return 1
    }
}

;點改造
handAlteration(){
    MouseMove, OrbOfAlteration[1], OrbOfAlteration[2] ,1
    ;btn("RButton")
    sleep speed*2
    click, right
    MouseMove, CurrentPage[1], CurrentPage[2] ,1
    sleep speed/2
    btn("LButton")
}
;點增幅
handAugmentation(){
    MouseMove, OrbOfAugmentation[1], OrbOfAugmentation[2] ,1
    sleep speed*2
    ;btn("RButton")
    click, right
    MouseMove, CurrentPage[1], CurrentPage[2] ,1
    sleep speed/2
    btn("LButton")
}


POEexit(){
    SendInput, {Enter}
    Clipboard = /exit
    Send ^v 
    SendInput, {Enter}    
    return
}