using module ./src/Controller.ps1

Add-Type -AssemblyName PresentationCore, PresentationFramework

$Xaml = Get-Content ./src/GUI.xaml
[xml]$xml = $Xaml

$reader = (New-Object System.Xml.XmlNodeReader $xml)
$window = [Windows.Markup.XamlReader]::Load($reader)

$confirm = $window.FindName("Confirm")
$cancel = $window.FindName("Cancel")
$adjust = $window.FindName("Adjust")

$dayTime = $window.FindName("DayTime")
$NightTime = $window.FindName("NightTime")

$DayColor = $window.FindName("DayColor")
$NightColor = $window.FindName("NightColor")

$confirm.Add_Click({
    $window.DialogResult = $true;
})

$cancel.Add_Click({
    $window.DialogResult = $false;
})

$adjust.Add_Click({
    if ($adjust.IsChecked) {
        
        # set text with times
    }
})

$window.ShowDialog()

# Validate time - kann man auch gleich in xaml pruefen
$string -match '^([0-1][0-9]|2[0-3]):[0-5][0-9]$'

Controller.CreatTask(
    $dayTime,
    $NightTime,
    $DayColor,
    $NightColor
)

# --- validate input

# --- close form

# --- after input read out field here ----

# Write-Host $pathTextBox = $window.FindName("boxer").Text
