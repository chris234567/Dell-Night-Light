using module ./ColorTemp.psm1


class Model {
    hidden [PSCustomObject] $Store;

    Model () {
        $this.Store = ( Get-Content ./Store.json -Raw ) | ConvertFrom-Json
    }

    [void] WriteValuesToDataBase() {
        $this.Store | ConvertTo-Json | Out-File ./store.json
    }

    [string] GetDayTime() { 
        return $this.Store.day.time
    } 
    
    hidden [void] SetDayTime([string] $value) { 
        $this.Store.day.time = $value 
    }

    [string] GetNightTime() { 
        return $this.Store.night.time
    } 
    
    hidden [void] SetNightTime([string] $value) { 
        $this.Store.night.time = $value 
    }

    [int] GetBrightnessDay() { 
        return $this.Store.day.brightness
    } 
    
    hidden [void] SetBrightnessDay([int] $value) { 
        $this.Store.day.brightness = $value 
    }

    [int] GetBrightnessNight() { 
        return $this.Store.night.brightness
    } 
    
    hidden [void] SetBrightnessNight([int] $value) { 
        $this.Store.night.brightness = $value 
    } 

    # [ColorTemp] GetColorTempDay() { 
    #     return $this.Store.day.color_temp
    # } 
    
    # hidden [void] SetColorTempDay([ColorTemp] $value) { 
    #     $this.Store.day.color_temp = $value 
    # } 

    # [ColorTemp] GetColorTempNight() { 
    #     return $this.Store.night.color_temp
    # } 
    
    # hidden [void] SetColorTempNight([ColorTemp] $value) { 
    #     $this.Store.night.color_temp = $value 
    # } 
}
