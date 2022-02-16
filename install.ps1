 <#
    .SYNOPSIS
        This script is used to install the Windows Forensic (Win-FOR) VM toolset into a Windows VM
        https://github.com/digitalsleuth/winfor-salt
    .DESCRIPTION
        The Windows Forensic (Win-FOR) VM comes with a multitude of tools for use in conducting digital forensics using a Windows
        Operating System. Many useful tools for malware analysis, reverse engineering, and advanced digital forensics are designed
        to run in Windows. Instead of creating a list for manual download, this installer, as well as the SaltStack state files
        which are part of the package, will allow for an easy, automated install. 
        Additionally, the Win-FOR states allow for the automated installation of the Windows Subsystem for Linux v2, and comes with
        the REMnux and SIFT toolsets, making the VM a one-stop shop for forensics!
    .NOTES
        Version        : 0.1
        Author         : Corey Forman (https://github.com/digitalsleuth)
        Prerequisites  : Windows 10 1909 or later
                       : Set-ExecutionPolicy must allow for script execution
    .PARAMETER username
        Choose the desired username to configure the installation for.
        If not selected, the currently logged in user will be selected.
    .PARAMETER mode
        There are two modes to choose from for the installation of the Win-FOR VM:
            addon: Install all of the tools, but don't do any customization. Leaves your config the way it is
            dedicated: Assumes that you want the full meal-deal, and will install all packages, customize the layout, and provide
                       additional reference documents
        If neither option is selected, the addon mode will be selected.
    .Example
        .\install.ps1 -username forensics -mode dedicated
    #>

param (
  [string]$username = "",
  [string]$mode = ""
)

[System.String]$saltstackVersion = '3004-3'
[System.String]$saltstackFile = 'Salt-Minion-' + $saltstackVersion + '-Py3-AMD64-Setup.exe'
[System.String]$saltstackHash = "D7B998C2BA5025200D13F55A0D7248DC9001E23949102D8E8A394C7733C1FA6B"
[System.String]$saltstackUrl = "https://repo.saltproject.io/windows/"
[System.String]$saltstackSource = $saltstackUrl + $saltstackFile
[System.String]$gitVersion = '2.35.1'
[System.String]$gitFile = 'Git-' + $gitVersion + '.2-64-bit.exe'
[System.String]$gitHash = "77768D0D1B01E84E8570D54264BE87194AA424EC7E527883280B9DA9761F0A2A"
[System.String]$gitUrl = "https://github.com/git-for-windows/git/releases/download/v" + $gitVersion + ".windows.2/" + $gitFile

function Verify-Hash($FileName, $HashName) {
    $fileHash = (Get-FileHash $FileName -Algorithm SHA256).Hash
    if ($fileHash -eq $HashName) {
        Write-Host "[+] Hashes match, continuing..." -ForegroundColor Green
    } else {
        Write-Host "[+] Hash values do not match, not continuing with install" -ForegroundColor Red
        exit
    }
}

function Get-Saltstack {
    if (-Not (Test-Path C:\Windows\Temp\$saltstackFile)) {
        [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
        Invoke-WebRequest $saltstackSource -OutFile "C:\Windows\Temp\$saltstackFile"
        Write-Host "[+] Verifying Download" -ForegroundColor Yellow
        Verify-Hash -FileName C:\Windows\Temp\$saltstackFile -HashName $saltstackHash
    } else {
        Write-Host "[!] Found existing SaltStack installer - validating hash before installing" -ForegroundColor Yellow
        Verify-Hash -FileName C:\Windows\Temp\$saltstackFile -HashName $saltstackHash
    }
}

function Install-Saltstack {
    $InstalledSalt = (Get-ItemProperty 'HKLM:\Software\Microsoft\Windows\CurrentVersion\Uninstall\*','HKLM:\Software\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\*' | ? {$_.DisplayName -clike 'Salt Minion*' } | select DisplayName, DisplayVersion)
    if ($InstalledSalt.DisplayName -eq $null) {
        Write-Host "[!] SaltStack not installed - Installing" -ForegroundColor Yellow
    } elseif ($InstalledSalt.DisplayName -clike 'Salt Minion*' -and $InstalledSalt.DisplayVersion -eq $saltstackVersion) {
        Write-Host "[+] SaltStack v$saltstackVersion already installed" -ForegroundColor Green
        return
    }
    Start-Process -Wait -FilePath "C:\Windows\Temp\$saltstackFile" -ArgumentList '/S /master=localhost /minion-name=WIN-FOR' -PassThru | Out-Null
    if ($?) {
        Write-Host "[+] SaltStack installed successfully" -ForegroundColor Green
    } else {
        Write-Host "[!] Installation of SaltStack failed. Please re-run the installer to try again" -ForegroundColor Red
        exit
    }
}

function Get-Git {
    if (-Not (Test-Path C:\Windows\Temp\$gitFile)) {
        [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
        Invoke-WebRequest $gitUrl -OutFile "C:\Windows\Temp\$gitFile"
        Write-Host "[+] Verifying Download" -ForegroundColor Yellow
        Verify-Hash -FileName C:\Windows\Temp\$gitFile -HashName $gitHash
    } else {
        Write-Host "[!] Found existing Git installer - validating hash before installing" -ForegroundColor Yellow
        Verify-Hash  -FileName C:\Windows\Temp\$gitFile -HashName $gitHash
    }
}

function Install-Git {
    $InstalledGit = (Get-ItemProperty 'HKLM:\Software\Microsoft\Windows\CurrentVersion\Uninstall\*','HKLM:\Software\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\*' | ? {$_.DisplayName -clike 'Git*' } | select DisplayName, DisplayVersion)
    if ($InstalledGit.DisplayName -eq $null) {
        Write-Host "[!] Git not installed - Installing"
    } elseif ($InstalledGit.DisplayName -clike 'Git*' -and $InstalledGit.DisplayVersion -clike "$gitVersion*") {
        Write-Host "[+] Git v$gitVersion already installed" -ForegroundColor Green
        return
    }
    Start-Process -Wait -FilePath "C:\Windows\Temp\$gitFile" -ArgumentList '/VERYSILENT /NORESTART /SP- /NOCANCEL /SUPPRESSMSGBOXES' -PassThru | Out-Null
    if ($?) {
        Write-Host "[+] Git installed successfully" -ForegroundColor Green
    } else {
        Write-Host "[!] Installation of Git failed. Please re-run the installer to try again" -ForegroundColor Red
        exit
    }
    Write-Host $?
}

function Install-WinFOR {
    Write-Host "[+] Cloning WinFOR-Salt repo" -ForegroundColor Yellow
    Start-Process -Wait -FilePath "C:\Program Files\Git\bin\git.exe" -ArgumentList "clone https://github.com/digitalsleuth/winfor-salt `"C:\ProgramData\Salt Project\Salt\srv\salt`"" -PassThru | Out-Null
    Write-Host "[+] The Win-FOR installer command is running, configuring for user $username - this will take a while... please be patient." -ForegroundColor Green
    Start-Process -Wait -FilePath "C:\Program Files\Salt Project\Salt\salt-call.bat" -ArgumentList ("-l debug --local --retcode-passthrough --state-output=mixed state.sls winfor.$mode pillar=`"{'winfor_user': '$username'}`" --log-file-level=debug --log-file=`"C:\winfor-saltstack.log`" --out-file=`"C:\winfor-saltstack.log`" --out-file-append") | Out-Null
    Write-Host "[+] Installation finished - cleaning up" -ForegroundColor Green
    Read-Host "Press any key to continue"
    exit
}

Write-Host "[*] Checking to see if this installer is running as administrator"

$runningUser = New-Object Security.Principal.WindowsPrincipal([Security.Principal.WindowsIdentity]::GetCurrent())
if (-not $runningUser.IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
    Write-Host "[!] Not running as administrator, please re-run this script as Administrator" -ForegroundColor Red
    Read-Host "Press any key to exit"
    exit 1
} else {
    Write-Host "[+] Running as Administrator, continuing..." -ForegroundColor Green
}

if ($username -eq "") {
    $username = [System.Environment]::UserName
    }
if ($mode -eq "") {
    $mode = "addon"
    }
Write-Host "[+] Downloading SaltStack v$saltstackVersion" -ForegroundColor Yellow
Get-Saltstack
Write-Host "[+] Installing SaltStack v$saltstackVersion" -ForegroundColor Yellow
Install-Saltstack
Write-Host "[+] Downloading Git v$gitVersion" -ForegroundColor Yellow
Get-Git
Write-Host "[+] Installing Git v$gitVersion" -ForegroundColor Yellow
Install-Git
Write-Host "[+] Running Win-FOR SaltStack installation" -ForegroundColor Green
Install-WinFOR
