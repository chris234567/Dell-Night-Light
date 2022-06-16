using module ./ColorTemp.psm1

class Controller {
    [void] CreateTask($model) {
        $Action = New-ScheduledTaskAction -Execute 'PowerShell.exe' -Argument $PSScriptRoot\SetBrightness.ps1
        $day = New-ScheduledTaskTrigger -Daily -At $model.GetDayTime() 
        $night = New-ScheduledTaskTrigger -Daily -At $model.GetNightTime() 
        Register-ScheduledTask -TaskName "MonitorSettings" -Trigger $day, $night -Action $Action
    }    

    hidden [System.Tuple] GetLocalSunSetAndRiseTimes([string] $country) {
        $location = Get-WinHomeLocation

        # option 1: convert geolocation into coords with google api (requires api key)
        # then make api call to sunrise-sunset.org

        $lat = ''
        $long = ''

        # option 2: "web crawl" sunrise-sunset.orgsunrise-sunset.org with geolocation for 
        # set and rise html tag

        # option 3: lookup coords in text file -> file too big

        # nonw is optimal in my opinion, there's no nice way to convert location to coord though 
        # or directly get coord with powershell

        # make api call
        $json = Invoke-RestMethod "https://api.sunrise-sunset.org/json?lat=$($lat)&lng=$($long)"

        # ...
        return $null
    }
}    
