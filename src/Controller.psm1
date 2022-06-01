using module ./src/ColorTemp.psm1

class Controller {
    [void] CreatTask($view) {

        
            

        # create task with task scheduler
        
        # retreive brightness & color temp from view??

        # foreach ($time in $DayTime, $NightTime) {
        #     $Action = New-ScheduledTaskAction -Execute 'pwsh.exe' -Argument '-NonInteractive -NoLogo -NoProfile -File ".\Set.ps1"'  # Hier auch methodenaufruf anstelle von datei moeglich??
        #     $Trigger = New-ScheduledTaskTrigger -Daily -At $time
        #     $Settings = New-ScheduledTaskSettingsSet
        #     $Task = New-ScheduledTask -Action $Action -Trigger $Trigger -Settings $Settings
        #     Register-ScheduledTask -TaskName 'Set Day' -InputObject $Task -User 'username' -Password 'passhere'
        # }
    }    
    
    hidden [void] AdjustMonitorSettings (
            [string]$Brightness, 
            [ColorTemp]$ColorTemp
        ) {
        # # warum funktioniert das nicht?!
        # where.exe ddm

        # Go to location of display manager executable (ddm.exe)
        Set-Location C:/ProgramFiles(x86)/Dell/DellDisplayManager

        ddm.exe /SetBrightnessLevel $Brightness /SetContrastLevel $ColorTemp

        # Commands

        # SetActiveInput [DVI2/HDMI/DP2,etc] - switches active input
        # RestoreFactoryDefaults - restores factory defaults*
        # AutoSetup - executes an autosetup (analog only)*
        # RestoreLevelDefaults - restores level defaults*
        # RestoreColorDefaults - restores color defaults*
        # SetBrightnessLevel X - sets brightness to X% (0-100)*
        # SetContrastLevel X - sets contrast to X% (0-100)*
        # SetNamedPreset [Movie/CAL1,etc] - changes the Preset mode*
        # SetPowerMode [on/off] - sets the display power mode*
        # SetOptimalResolution - switches to optimal resolution
        # SaveProfile [Name] - save settings to named profile*
        # RestoreProfile [Name] - restore settings from named profile*
        # DeleteProfile [Name] - delete named profile
        # SetGridType [X] - changes Easy Arrange grid type to X
        # Rescan - rescans display hardware
        # ForceReset - reconnects and rescans display hardware
        # SetControl X Y - sets hex control X to hex value Y
        # IncControl X Y - increases the value of control X by Y
        # DecControl X Y - decreases the value of control X by Y
        # SetPxPMode [Off/PiP/PBP Main Sub1] - set PxP mode/inputs
        # Zoom - switches between PxP and fullscreen mode
        # Wait X - pause X milliseconds
        # Exit - terminates the program
    }
}    


