#   Szymon Kolano
#   https://github.com/skolano
#   ---------------------------------------------
#   This is post installation script. 
#       - Cocolatey will be installed
#       - Default software will be installed
#           - vlc, brave, firefox, onlyoffice, acrobat reader, 7zip etc...
#       - Edge Browser will be removed
#       - Microsoft Upddates will download and install ONLY security updates!
#



# Function - Install Chocolatey Package Manager
function InstallChoco {

}

# Function - Install Default Software via Chocolatey
function InstallChocoDefaults {
    
}

# Remove Edge Browser 
function RemoveEdge {
    $edge = ${Env:ProgramFiles(x86)} + "\Microsoft\Edge\Application"

    if (Test-Path $edge) {
        Get-ChildItem -Path $edge -Filter setup.exe -Recurse -ErrorAction SilentlyContinue -Force |
        Foreach-Object {
            Start-Process $_.FullName "-uninstall -system-level -verbose-logging -force-uninstall" -wait
            Write-Host "Edgeium Is Uninstalled."
            Write-Host "`n"
        }
    } else {
        Write-Host "Edge is Uninstalled!"
        Write-Host "`n"
    }
}