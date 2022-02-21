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
        .\install.ps1 -user forensics -mode dedicated
	.TODO
	    If saltstack is not the proper version, uninstall and re-install
		Update (re-install current version)
		Upgrade (if already installed)
		WSL with SIFT and REMnux (optional)
    #>

param (
  [string]$user = "",
  [string]$mode = "",
  [switch]$update,
  [switch]$upgrade,
  [switch]$version,
  [switch]$wsl
)

[string]$saltstackVersion = '3004-3'
[string]$saltstackFile = 'Salt-Minion-' + $saltstackVersion + '-Py3-AMD64-Setup.exe'
[string]$saltstackHash = "D7B998C2BA5025200D13F55A0D7248DC9001E23949102D8E8A394C7733C1FA6B"
[string]$saltstackUrl = "https://repo.saltproject.io/windows/"
[string]$saltstackSource = $saltstackUrl + $saltstackFile
[string]$gitVersion = '2.35.1'
[string]$gitFile = 'Git-' + $gitVersion + '.2-64-bit.exe'
[string]$gitHash = "77768D0D1B01E84E8570D54264BE87194AA424EC7E527883280B9DA9761F0A2A"
[string]$gitUrl = "https://github.com/git-for-windows/git/releases/download/v" + $gitVersion + ".windows.2/" + $gitFile
[string]$logFile = "C:\winfor-saltstack.log"

function Compare-Hash($FileName, $HashName) {
    $fileHash = (Get-FileHash $FileName -Algorithm SHA256).Hash
    if ($fileHash -eq $HashName) {
        Write-Host "[+] Hashes match, continuing..." -ForegroundColor Green
    } else {
        Write-Host "[+] Hash values do not match, not continuing with install" -ForegroundColor Red
        exit
    }
}

function Get-Saltstack {
    $InstalledSalt = (Get-ItemProperty 'HKLM:\Software\Microsoft\Windows\CurrentVersion\Uninstall\*','HKLM:\Software\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\*' | Where-Object {$_.DisplayName -clike 'Salt Minion*' } | Select-Object DisplayName, DisplayVersion)
    if ($InstalledSalt.DisplayName -eq $null) {
        Write-Host "[!] SaltStack not installed" -ForegroundColor Yellow
    } elseif ($InstalledSalt.DisplayName -clike 'Salt Minion*' -and $InstalledSalt.DisplayVersion -eq $saltstackVersion) {
        Write-Host "[+] SaltStack v$saltstackVersion already installed" -ForegroundColor Green
        return
    }
    if (-Not (Test-Path C:\Windows\Temp\$saltstackFile)) {
        [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
        Write-Host "[+] Downloading SaltStack v$saltstackVersion" -ForegroundColor Yellow
        Invoke-WebRequest $saltstackSource -OutFile "C:\Windows\Temp\$saltstackFile"
        Write-Host "[+] Verifying Download" -ForegroundColor Yellow
        Compare-Hash -FileName C:\Windows\Temp\$saltstackFile -HashName $saltstackHash
        Write-Host "[+] Installing SaltStack v$saltstackVersion" -ForegroundColor Yellow
        Install-Saltstack
    } else {
        Write-Host "[!] Found existing SaltStack installer - validating hash before installing" -ForegroundColor Yellow
        Compare-Hash -FileName C:\Windows\Temp\$saltstackFile -HashName $saltstackHash
        Write-Host "[+] Installing SaltStack v$saltstackVersion" -ForegroundColor Yellow
        Install-Saltstack
    }
}

function Install-Saltstack {
    Start-Process -Wait -FilePath "C:\Windows\Temp\$saltstackFile" -ArgumentList '/S /master=localhost /minion-name=WIN-FOR' -PassThru | Out-Null
    if ($?) {
        Write-Host "[+] SaltStack installed successfully" -ForegroundColor Green
    } else {
        Write-Host "[!] Installation of SaltStack failed. Please re-run the installer to try again" -ForegroundColor Red
        exit
    }
}

function Get-Git {
    $InstalledGit = (Get-ItemProperty 'HKLM:\Software\Microsoft\Windows\CurrentVersion\Uninstall\*','HKLM:\Software\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\*' | Where-Object {$_.DisplayName -clike 'Git*' } | Select-Object DisplayName, DisplayVersion)
    if ($InstalledGit.DisplayName -eq $null) {
        Write-Host "[!] Git not installed" -ForegroundColor Yellow
    } elseif ($InstalledGit.DisplayName -clike 'Git*' -and $InstalledGit.DisplayVersion -clike "$gitVersion*") {
        Write-Host "[+] Git v$gitVersion already installed" -ForegroundColor Green
        return
    }
    if (-Not (Test-Path C:\Windows\Temp\$gitFile)) {
        [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
        Write-Host "[+] Downloading Git v$gitVersion" -ForegroundColor Yellow
        Invoke-WebRequest $gitUrl -OutFile "C:\Windows\Temp\$gitFile"
        Write-Host "[+] Verifying Download" -ForegroundColor Yellow
        Compare-Hash -FileName C:\Windows\Temp\$gitFile -HashName $gitHash
        Write-Host "[+] Installing Git v$gitVersion" -ForegroundColor Yellow
        Install-Git
    } else {
        Write-Host "[!] Found existing Git installer - validating hash before installing" -ForegroundColor Yellow
        Compare-Hash  -FileName C:\Windows\Temp\$gitFile -HashName $gitHash
        Write-Host "[+] Installing Git v$gitVersion" -ForegroundColor Yellow
        Install-Git
    }
}

function Install-Git {
    Start-Process -Wait -FilePath "C:\Windows\Temp\$gitFile" -ArgumentList '/VERYSILENT /NORESTART /SP- /NOCANCEL /SUPPRESSMSGBOXES' -PassThru | Out-Null
    if ($?) {
        Write-Host "[+] Git installed successfully" -ForegroundColor Green
    } else {
        Write-Host "[!] Installation of Git failed. Please re-run the installer to try again" -ForegroundColor Red
        exit
    }
}

function Install-WinFOR {
    Write-Host "[+] Cloning WinFOR-Salt repo" -ForegroundColor Yellow
    Start-Process -Wait -FilePath "C:\Program Files\Git\bin\git.exe" -ArgumentList "clone https://github.com/digitalsleuth/winfor-salt `"C:\ProgramData\Salt Project\Salt\srv\salt`"" -PassThru | Out-Null
    Write-Host "[+] The Win-FOR installer command is running, configuring for user $user - this will take a while... please be patient" -ForegroundColor Green
    Start-Process -Wait -FilePath "C:\Program Files\Salt Project\Salt\salt-call.bat" -ArgumentList ("-l debug --local --retcode-passthrough --state-output=mixed state.sls winfor.$mode pillar=`"{'winfor_user': '$user'}`" --log-file-level=debug --log-file=`"$logFile`" --out-file=`"$logFile`" --out-file-append") | Out-Null
    $results = (Select-String -Path $logFile -Pattern 'Succeeded:' -Context 1 | ForEach-Object{"[!] " + $_.Line; "[!] " + $_.Context.PostContext} | Out-String).Trim()
    $failures = (Select-String -Path $logFile -Pattern 'Succeeded:' -Context 1 | ForEach-Object{$_.Context.PostContext}).split(':')[1].Trim()
    if ($failures -ne 0) {
        Write-Host $results -ForegroundColor Yellow
        Write-Host "[!] To determine the cause of the failures, review the log file at $logFile and search for lines containing [ERROR   ]"
    } else {
        Write-Host $results -ForegroundColor Green
        Read-Host "Press any key to continue"
    exit
    }
    if ($wsl) {
        $results | Out-File "C:\winfor-results.log"
        $wslLogFile = "C:\winfor-wsl.log"
        Write-Host "[+] Installing WSLv2 with SIFT and REMnux"
        Start-Process -Wait -FilePath "C:\Program Files\Salt Project\Salt\salt-call.bat" -ArgumentList ("-l debug --local --retcode-passthrough --state-output=mixed state.sls winfor.wsl pillar=`"{'winfor_user': '$user'}`" --log-file-level=debug --log-file=`"$wslLogFile`" --out-file=`"$wslLogFile`" --out-file-append") | Out-Null
        Write-Host "[+] Installation finished" -ForegroundColor Green
    }
}
function Invoke-Installer {
    $versionFile = "C:\ProgramData\Salt Project\Salt\srv\salt\winfor-version"
    $runningUser = New-Object Security.Principal.WindowsPrincipal([Security.Principal.WindowsIdentity]::GetCurrent())
    if (-not $runningUser.IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
        Write-Host "[!] Not running as administrator, please re-run this script as Administrator" -ForegroundColor Red
        exit 1
    }
    if($version) {
        if(-Not (Test-Path $versionFile)) {
            $winforVersion = 'not installed'
        } else {
            $winforVersion = "v" + (Get-Content $versionFile)
        }
        Write-Host "WIN-FOR is $winforVersion" -ForegroundColor Green
        exit
    }
    if ($user -eq "") {
        $user = [System.Environment]::UserName
        }
    if ($mode -eq "") {
        $mode = "addon"
        }
    Get-Saltstack
    Get-Git
    Write-Host "[+] Refreshing environment variables" -ForegroundColor Yellow
    $env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine")
    Write-Host "[+] Running Win-FOR SaltStack installation" -ForegroundColor Green
    Install-WinFOR
}
Invoke-Installer