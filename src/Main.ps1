using module ./src/View.psm1
using module ./src/Controller.psm1

Add-Type -AssemblyName PresentationCore, PresentationFramework
$view = [View]::new()

# if ($view.window.DialogResult) {
#     # set windows schedule
#     Write-Host "Hello World"
# }


## datenbank nur da um persistent data zu garantieren 

## beim weg nach draussen datenbank aktualisieren

# for field in view 
#     database[field] = field.value




