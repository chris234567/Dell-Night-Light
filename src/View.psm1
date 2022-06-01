class View {
    hidden [object] $Window
    
    View() {
        Add-Type -AssemblyName PresentationCore, PresentationFramework

        [xml]$xml = Get-Content "C:\Users\Chris\VSCodeProjects\Dell-Night-Light\src\GUI.xaml"
        
        $reader = (New-Object System.Xml.XmlNodeReader $xml)
        $this.window = [Windows.Markup.XamlReader]::Load($reader)
        $this.window.ShowDialog()
    }

}



# using module ./ColorTemp.psm1

# # enum Control {
# #     ConfirmButton
# #     CancelButton
# #     LocalTimesCheckBox
# #     DayTimeTextBox
# #     NightTimeTextBox
# #     DayColorTextBox
# #     NightColorTextBox
# # }

# class View {
#     hidden [object] $Window;
#     hidden [hashtable] $Controls = @{ };
    
#     hidden [int] $Brightness;
#     #hidden [ColorTemp] $ColorTemp;
    
#     View() {
#         Add-Type -AssemblyName PresentationCore, PresentationFramework

#         [xml]$xml = Get-Content ./GUI.xaml
        
#         $reader = (New-Object System.Xml.XmlNodeReader $xml)
#         $this.window = [Windows.Markup.XamlReader]::Load($reader)

#         # $this.LoadControlReferences()
#         # $this.AddHandler()

#         ## methode um datenbank zu initialisieren falls werte null
#         # Load (default) database values

#         $this.window.ShowDialog()

#         # Validate time - kann man auch gleich in xaml pruefen
#         # $string -match '^([0-1][0-9]|2[0-3]):[0-5][0-9]$'

        
#         # --- validate input

#         # validate warschl am besten in der xml
#         # mit  '^([0-1][0-9]|2[0-3]):[0-5][0-9]$'


#         # --- close form

#         # Write-Host $pathTextBox = $window.FindName("boxer").Text

#     }

#     # [void] LoadControlReferences() {
#     #     foreach ($Control in [Control].GetEnumNames()) {
#     #         $this.Controls[$Control] = $this.window.FindName($Control)
#     #     }
#     # }

#     [void] AddHandler() {

#         ## on load handler um daten initial reinzuladen

#         ## on confirm button pressed Set brightness usw. fields

#         # ... handler ...

#         # $Controls[Control.ConfirmButton].Add_Click({
#         #     $this.window.DialogResult = $true;
#         # })

#         # $Controls[Control.CancelButton].Add_Click({
#         #     $this.window.DialogResult = $false;
#         # })

#         # $Controls[Control.LocalTimesCheckBox].Add_Click({
#         #     if ($adjust.IsChecked) {
#         #         $this.window
#         #         # set text with times
#         # })
#     }

#     [int] GetBrightness() { 
#         # hier zugriff auf database
#         # vielleicht mir generalisierter mehtode?? wird ja in beiden settern/gettern ähnlich verwedent
#         return $this.Brightness
#     } 
    
#     [void] SetBrightness([int] $value) { 
#         # hier zugriff auf database
#         $this.Brightness = $value 
#     } 

#     [int] GetColorTemp() { 
#         # hier zugriff auf database
#         # vielleicht mir generalisierter mehtode?? wird ja in beiden settern/gettern ähnlich verwedent
#         return $this.ColorTemp
#     } 
    
#     [void] SetColorTemp([int] $value) { 
#         # hier zugriff auf database
#         $this.ColorTemp = $value 
#     } 
# }