# using assembly PresentationCore
# using assembly PresentationFramework

using assembly C:\WINDOWS\Microsoft.Net\assembly\GAC_32\PresentationCore\v4.0_4.0.0.0__31bf3856ad364e35\PresentationCore.dll
using assembly C:\WINDOWS\Microsoft.Net\assembly\GAC_MSIL\PresentationFramework\v4.0_4.0.0.0__31bf3856ad364e35\PresentationFramework.dll

using module ./View.psm1
using module ./Controller.psm1
using module ./Model.psm1

$model = [Model]::new()
$view = [View]::new($model)
$model.WriteValuesToDataBase()

# if ($view.DialogResult) {
#     # set windows schedule
#     # Controller.CreateTask($model)
# }
