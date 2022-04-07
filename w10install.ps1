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
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))

}

# Function - Install Default Software via Chocolatey
function InstallChocoDefaults {
choco install vlc -y
choco install firefox -y
choco install brave -y
choco install 7zip -y
choco install adobereader -y
choco install rufus -y
choco install onlyoffice -f
choco install keepassxc -y
choco install gimp -y
choco install steam -y
choco install inkscape -y
choco install adwcleaner -y
choco install signal -y
choco install youtube-dl-gui -y
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

# Disable Windows Updates
sc.exe config wuauserv start= disabled
sc.exe stop wuauserv
sc.exe start wuauserv