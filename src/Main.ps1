using module ./View

$view = [View]::new()
$view.CreateView()

## methode um datenbank zu initialisieren falls werte null

## datenbank nur da um persistent data zu garantieren 

## beim weg nach draussen datenbank aktualisieren

for field in view 
    database[field] = field.value