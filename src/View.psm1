using module ./ColorTemp.psm1
using module ./Control.psm1
using module ./Model.psm1
using module ./Controller.psm1


class View {
    hidden [hashtable] $Controls = @{ };
    hidden [Model] $Model;
    
    View($window, $model) {
        $this.Model = $model

        $this.RetreiveReferences($window)
        $this.AddHandler($window)
    }

    hidden [void] RetreiveReferences($window) {
        foreach ($Control in [Control].GetEnumNames()) {
            $this.Controls.Add($Control, $window.FindName($Control))
        }
    }

    hidden [void] AddHandler($window) {
        $this.Controls["ConfirmButton"].Add_Click({
            $window.DialogResult = $true
        })

        $this.Controls["CancelButton"].Add_Click({
            $window.DialogResult = $false
        })
    }

    [void] LoadValues() {
        $this.Controls["DayTimeTextBox"].Text = $this.Model.GetDayTime()
        $this.Controls["NightTimeTextBox"].Text = $this.Model.GetNightTime()

        $this.Controls["DayBrightnessTextBox"].Text = $this.Model.GetBrightnessDay()
        $this.Controls["NightBrightnessTextBox"].Text = $this.Model.GetBrightnessNight()
        
        $this.Controls["DDMPath"].Text = $this.Model.GetDDMPath()
        
        # $this.Controls["DayColorComboBox"].Text = $this.Model.GetColorDay()
        # $this.Controls["NightColorComboBox"].Text = $this.Model.GetColorNight()
    }
    
    [void] StoreValues() {
        $this.Model.SetDayTime($this.Controls["DayTimeTextBox"].Text)
        $this.Model.SetNightTime($this.Controls["NightTimeTextBox"].Text)
        
        $this.Model.SetBrightnessDay($this.Controls["DayBrightnessTextBox"].Text)
        $this.Model.SetBrightnessNight($this.Controls["NightBrightnessTextBox"].Text)
        
        $this.Model.SetDDMPath($this.Controls["DDMPath"].Text)

        # $this.Model.SetColorDay($this.Controls["DayColorComboBox"].Text)
        # $this.Model.SetColorNight($this.Controls["NightColorComboBox"].Text)
    }
}
