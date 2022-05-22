# GUI was created at https://poshgui.com/

Add-Type -AssemblyName PresentationCore, PresentationFramework

$Xaml = Get-Content ./src/GUI.xaml
$Window = [Windows.Markup.XamlReader]::Parse($Xaml)

[xml]$xml = $Xaml

$xml.SelectNodes("//*[@Name]") | ForEach-Object { Set-Variable -Name $_.Name -Value $Window.FindName($_.Name) }

# ---- WIP -----

# $XML_Node_Reader = (New-Object System.Xml.XmlNodeReader $xml)
# $xml = [Windows.Markup.XamlReader]::Load($XML_Node_Reader)
# $Btn = $xml.FindName('Btn_ConnectDialog_Connect')
# $Txt = $xml.FindName('Txt_ConnectDialog_Input')


# $Btn_ConnectDialog_Connect.Add_Click({
#     # hier könnte man das mit den lokalen zeiten implementieren und das xaml verändern
# })

# ---- WIP -----

$Window.ShowDialog()



# MVC anwenden??
# Model graphic klasse
# controller klasse
# view klasse
