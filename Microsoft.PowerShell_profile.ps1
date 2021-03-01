# Tab Completion
Set-PSReadlineKeyHandler -Key Tab -Function Complete

# PS Alias for linux-like use
New-Alias -Name "ll" Get-ChildItem

# Create or change to project dir
$root_path = "C:\"
$prj_folder = "projects"
$project_path = $root_path + $prj_folder
if(!(Test-Path -Path $project_path)) {
    New-Item -Path $root_path -Name $prj_folder -ItemType "directory"
}
Set-Location -Path $project_path

Clear-Host
