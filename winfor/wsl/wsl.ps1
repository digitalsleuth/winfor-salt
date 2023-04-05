$filePath = "C:\Program Files\Salt Project\Salt\salt-call.bat"
$wslLogFile = "C:\winfor-wsl.log"
$runningUser = New-Object Security.Principal.WindowsPrincipal([Security.Principal.WindowsIdentity]::GetCurrent())
if (-Not $runningUser.IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
    Write-Host "[!] Not running as administrator, please re-run this script as Administrator" -ForegroundColor Red
    Read-Host "Press any key to continue"
}
#Write-Host "[+] Lowering UAC level..." -ForegroundColor Green
#Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" -Name "ConsentPromptBehaviorAdmin" -Type DWord -Value 0
#Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" -Name "PromptOnSecureDesktop" -Type DWord -Value 0
Write-Host "[+] Downloading WIN-FOR template and installing SIFT & REMnux" -ForegroundColor Green
Start-Process -Wait -FilePath $filePath -ArgumentList ($saltArgs) | Out-Null
if (-Not (Test-Path $wslLogFile)) {
    $wslSetupResults=$wslSetupFailures=$wslResults=$wslFailures=$errors=$null
	} else {
$wslErrorLog = "C:\winfor-wsl-errors.log"
$wslSetupResults = (Select-String -Path $wslLogFile -Pattern 'Succeeded:' -Context 1 | Select-Object -First 1 | ForEach-Object{"[+] " + $_.Line; "[!] " + $_.Context.PostContext} | Out-String).Trim()
$wslSetupFailures = (Select-String -Path $wslLogFile -Pattern 'Succeeded:' -Context 1 | Select-Object -First 1 | ForEach-Object{$_.Context.PostContext})
$wslResults = (Select-String -Path $wslLogFile -Pattern 'Succeeded:' -Context 1 | Select-Object -Last 1 | ForEach-Object{"[+] " + $_.Line; "[!] " + $_.Context.PostContext} | Out-String).Trim()
$wslFailures = (Select-String -Path $wslLogFile -Pattern 'Succeeded:' -Context 1 | Select-Object -Last 1 | ForEach-Object{$_.Context.PostContext})
if ($wslFailures -ne $null) {$wslFailures = $wslFailures.split(':')[1].Trim() }
if ($wslSetupFailures -ne $null) {$wslSetupFailures = $wslSetupFailures.split(':')[1].Trim() }
$errors = (Select-String -Path $wslLogFile -Pattern '          ID:' -Context 0,6 | ForEach-Object{$_.Line; $_.Context.DisplayPostContext + "`r-------------"})
}
if ($repoLogFile -eq "C:\") {
    $repoResults=$repoFailures=$null
} else {
$repoResults = (Select-String -Path $repoLogFile -Pattern 'Succeeded:' -Context 1 | Select-Object -Last 1 | ForEach-Object{"[+] " + $_.Line; "[!] " + $_.Context.PostContext} | Out-String).Trim()
$repoFailures = (Select-String -Path $repoLogFile -Pattern 'Succeeded:' -Context 1 | Select-Object -Last 1 | ForEach-Object{$_.Context.PostContext})
if ($repoFailures -ne $null) {$repoFailures = $repoFailures.split(':')[1].Trim() }
}
if (($repoFailures -ne 0 -and $repoFailures -ne $null) -or ($wslFailures -ne 0 -and $wslFailures -ne $null) -or ($wslSetupFailures -ne 0 -and $wslSetupFailures -ne $null)){
    Write-Host "[!] Installation finished with errors" -ForegroundColor Yellow
    Write-Host "[!] Showing only sections with failures" -ForegroundColor Yellow
if ($repoFailures -ne 0 -and $repoFailures -ne $null) {
    $errors | Out-File $wslErrorLog -Append
    $errors = ''
    Write-Host ("`n--- Repo Configuration Results ---`n" + $repoResults) -ForegroundColor Yellow
}
if (($wslFailures -ne 0 -and $wslFailures -ne $null) -or ($wslSetupFailures -ne 0 -and $wslSetupFailures -ne $null)) {
    $errors | Out-File $wslErrorLog -Append
    $errors = ''
    Write-Host ("`n--- WSL2 Setup Results ---`n" + $wslSetupResults) -ForegroundColor Yellow
    Write-Host ("`n--- WSL2 Configuration Results ---`n" + $wslResults) -ForegroundColor Yellow
}
    Write-Host "[!] To determine the cause of the failures, review the log file $wslLogFile and search for lines containing `n[ERROR   ] or review $wslErrorLog for a less verbose listing." -ForegroundColor Yellow
    Write-Host "[!] In order to ensure all configuration changes are successful, it is recommended to reboot before first use." -ForegroundColor Yellow
} else {
    Write-Host "[+] Installation finished successfully" -ForegroundColor Green
    Write-Host ("`n--- Repo Configuration Results ---`n" + $repoResults) -ForegroundColor Green
    Write-Host ("`n--- WSL2 Setup Results         ---`n" + $wslSetupResults) -ForegroundColor Green
    Write-Host ("`n--- WSL2 Configuration Results ---`n" + $wslResults) -ForegroundColor Green
    Write-Host "[!] In order to ensure all configuration changes are successful, it is recommended to reboot before first use.`n" -ForegroundColor Green
}
Read-Host "Press any key to continue"
