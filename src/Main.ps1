using module ./View.psm1
using module ./Controller.psm1
using module ./Model.psm1

Add-Type -AssemblyName 'PresentationCore'
Add-Type -AssemblyName 'PresentationFramework'


[xml]$xml = Get-Content ./GUI.xaml

$reader = (New-Object System.Xml.XmlNodeReader $xml)
$window = [Windows.Markup.XamlReader]::Load($reader)

$model = [Model]::new()
$controller = [Controller]::new()
$view = [View]::new($window, $model)

$view.LoadValues()
       
$window.ShowDialog()

if ($window.DialogResult -eq $false) {
    # end dialog without making changes
    return
}

if ($view.Controls["LocalTimesCheckBox"].Checked) {
    # to be implemented
    # $times = $controller.GetLocalSunSetAndRiseTimes()
    
    # $model.SetDayTime($times.Item1)
    # $model.SetNightTime($times.Item2)
} else {
    $view.StoreValues()
}

$model.WriteValuesToDataBase()
$controller.CreateTask($model)
