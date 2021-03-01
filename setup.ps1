##############################################################################
# Best to copy/paste this, unless you've already set the execution policy
##############################################################################


# Only create profile if it doesn't exist
if(!(Test-Path $profile)) {
    New-item –type file –force $profile
}

Set-ExecutionPolicy RemoteSigned
