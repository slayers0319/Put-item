ReadSettings(){
    ;IniRead, OutputVar, Filename, Section, Key [, Default]
    IniRead, resolutionX,  settings.ini, settings, resolutionX,  1920
    IniRead, resolutionY,  settings.ini, settings, resolutionY,  1080
    IniRead, Mod1,  settings.ini, settings, Mod1,  "NULL1"
    IniRead, Mod2,  settings.ini, settings, Mod2,  "NULL2"
    IniRead, Mod3,  settings.ini, settings, Mod3,  "NULL3"
    IniRead, Mod4,  settings.ini, settings, Mod4,  "NULL4"
    IniRead, speed,  settings.ini, settings, speed,  40
    IniRead, StorageSpeed,  settings.ini, settings, StorageSpeed,  40
    return
}

SaveSettings(){
    IniWrite, %resolutionX%,  settings.ini, settings, resolutionX
    IniWrite, %resolutionY%,  settings.ini, settings, resolutionY
    IniWrite, %Mod1%,         settings.ini, settings, Mod1
    IniWrite, %Mod2%,         settings.ini, settings, Mod2
    IniWrite, %Mod3%,         settings.ini, settings, Mod3
    IniWrite, %Mod4%,         settings.ini, settings, Mod4
    IniWrite, %speed%,  settings.ini, settings, speed
    IniWrite, %StorageSpeed%, settings.ini, settings, StorageSpeed
    return
}