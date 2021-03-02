# Tab Completion
Set-PSReadlineKeyHandler -Key Tab -Function Complete


# Color Stuff
$Host.UI.RawUI.BackgroundColor = 'Black'
$Host.UI.RawUI.ForegroundColor = 'Green'
$Host.PrivateData.ErrorForegroundColor    = 'White'
$Host.PrivateData.ErrorBackgroundColor    = 'Black'
$Host.PrivateData.WarningForegroundColor  = 'Yellow'
$Host.PrivateData.WarningBackgroundColor  = 'Black'
$Host.PrivateData.DebugForegroundColor    = 'Yellow'
$Host.PrivateData.DebugBackgroundColor    = 'Black'
$Host.PrivateData.VerboseForegroundColor  = 'Green'
$Host.PrivateData.VerboseBackgroundColor  = 'Black'
$Host.PrivateData.ProgressForegroundColor = 'DarkGray'
$Host.PrivateData.ProgressBackgroundColor = 'Black'
Clear-Host


# Install CHocolatey
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
choco install packages.config
refreshenv

# Set up some nice aliases
New-Alias ll Get-Childitem
New-Alias touch New-Item
New-Alias grep sls

# Find terraform and tf apps (tflint, tfsec)
$tfloc = where.exe terraform.exe
Set-Alias -Name tf -Value $tfloc

$tfdocs = where.exe terraform-docs.exe
$tfsec  = where.exe tfsec.exe
$tflint = where.exe tflint.exe

# Terraform shortcuts
function tfi { Invoke-Expression "$tfloc init" }
function tfiu { Invoke-Expression "$tfloc init --upgrade" }
function tfp { Invoke-Expression "$tfloc plan" }
function tfv { Invoke-Expression "$tfloc validate" }
function tfa { Invoke-Expression "$tfloc apply --auto-approve" }
function tfd { Invoke-Expression "$tfloc destroy --auto-approve" }
function tfo { Invoke-Expression "$tfloc output" }
function tfdocs { Invoke-Expression "$tfdocs md . > readme.md" }
function tfl { Invoke-Expression "$tflint --aws-creds-file='$env:UserName\.aws\credentials'" }
#function tfsec { Invoke-Expression "$tfsec" }


# Create or change to project dir
$root_path = "C:\"
$prj_folder = "projects"
$project_path = $root_path + $prj_folder
if(!(Test-Path -Path $project_path)) {
    New-Item -Path $root_path -Name $prj_folder -ItemType "directory"
}
Set-Location -Path $project_path

Clear-Host
