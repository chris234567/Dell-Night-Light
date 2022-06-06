using module ./ColorTemp.psm1
using module ./Control.psm1
using module ./Model.psm1


class View {
    hidden [hashtable] $Controls = @{ };
    hidden [Model] $Model;
    [bool] $DialogResult;
    
    View($model) {
        $this.Model = $model

        [xml]$xml = Get-Content ./GUI.xaml

        $reader = (New-Object System.Xml.XmlNodeReader $xml)
        $Window = [Windows.Markup.XamlReader]::Load($reader)
        
        # Retreive references to controls
        foreach ($Control in [Control].GetEnumNames()) {
            $this.Controls.Add($Control, $Window.FindName($Control))
        }

        # Add handler
        $this.Controls["ConfirmButton"].Add_Click({
            $this.DialogResult = $true
        })

        $this.Controls["CancelButton"].Add_Click({
            $this.DialogResult = $false
        })

        # $this.Controls["LocalTimesCheckBox"].Checked += ({
        #     Write-Host "heeee"
        #     if ($this.Controls["LocalTimesCheckBox"].IsChecked) {
        #         $this.Controls["DayTimeTextBox"].Text = "cheeser"
        #         $this.Controls["NightTimeTextBox"].Text = "cheeser1"
        #         # set text with times
        #     }
        # })

        $this.LoadValues()
        
        $Window.Show()
        
        # Validate time - kann man auch gleich in xaml pruefen

        # VALIDATE IN XAML CODE??

        # $string -match '^([0-1][0-9]|2[0-3]):[0-5][0-9]$'
        
        # --- validate input
        $this.StoreValues()
        }

    [void] LoadValues() {
        $this.Controls["DayTimeTextBox"].Text = $this.Model.GetDayTime()
        $this.Controls["NightTimeTextBox"].Text = $this.Model.GetNightTime()

        $this.Controls["DayBrightnessTextBox"].Text = $this.Model.GetBrightnessDay()
        $this.Controls["NightBrightnessTextBox"].Text = $this.Model.GetBrightnessNight()

        # $this.Controls["DayColorComboBox"].Text = $this.Model.GetColorDay()
        # $this.Controls["NightColorComboBox"].Text = $this.Model.GetColorNight()
    }

    [void] StoreValues() {
        $this.Model.SetDayTime($this.Controls["DayTimeTextBox"].Text)
        $this.Model.SetNightTime($this.Controls["NightTimeTextBox"].Text)

        $this.Model.SetBrightnessDay($this.Controls["DayBrightnessTextBox"].Text)
        $this.Model.SetBrightnessNight($this.Controls["NightBrightnessTextBox"].Text)

        # $this.Model.SetColorDay($this.Controls["DayColorComboBox"].Text)
        # $this.Model.SetColorNight($this.Controls["NightColorComboBox"].Text)
    }
}