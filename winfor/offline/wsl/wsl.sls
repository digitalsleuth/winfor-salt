# Name: WSL Setup
# Website: https://microsoft.com
# Description: Windows Subsystem for Linux setup
# Category: Terminals
# Author: Microsoft
# License: EULA
# Version: 0.0
# Notes: 

WSL is not yet fully tested for installation offline:
  test.nop

{% set user = salt['pillar.get']('winfor_user', 'forensics') %}
{% set SID = salt['user.info'](user).uid %}
{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set downloads = salt['pillar.get']('offline', 'C:\winfor-downloads' %}
{% set version = salt['cp.get_file_str']("C:\ProgramData\Salt Project\Salt\srv\salt\winfor\VERSION") %}
{% set PROGRAMDATA = salt['environ.get']('PROGRAMDATA') %}
{% set defender_status = salt['cmd.powershell']('((Get-Service) -match "WinDefend").Name') %}

include:
  - winfor.config.user

{% if defender_status.lower() == "windefend" %}
wsl-defender-exclusion-offline:
  cmd.run:
    - names:
      - 'echo "Defender is present on this system."'
      - 'Add-MpPreference -ExclusionPath "{{ inpath }}"'
      - 'Add-MpPreference -ExclusionPath "C:\salt\tempdownload"'
      - 'Add-MpPreference -ExclusionPath "{{ PROGRAMDATA }}\Salt Project\Salt\var"'
    - shell: powershell

{% else %}

"Defender is not present on this system - no exclusions are required to install WSL for WIN-FOR offline.":
  test.nop

{% endif %}

wsl-dism-cleanup-offline:
  cmd.run:
    - name: 'dism /online /cleanup-image /revertpendingactions'
    - shell: cmd

wsl-install-offline:
  cmd.run:
    - name: 'dism /online /quiet /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart'
    - shell: cmd
    - success_retcodes: 3010
    - require:
      - cmd: wsl-dism-cleanup-offline

vmp-install-offline:
  cmd.run:
    - name: 'dism /online /quiet /enable-feature /featurename:VirtualMachinePlatform /all /norestart'
    - shell: cmd
    - success_retcodes: 3010
    - require:
      - cmd: wsl-install-offline

powershell-execution-policy-offline:
  reg.present:
    - name: HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\PowerShell\1\ShellIds\Microsoft.PowerShell
    - vname: ExecutionPolicy
    - vtype: REG_SZ
    - vdata: Bypass

powershell-execution-policy-path-offline:
  reg.present:
    - name: HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\PowerShell\1\ShellIds\Microsoft.PowerShell
    - vname: Path
    - vtype: REG_SZ
    - vdata: 'C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe'

wsl-set-uac-1-offline:
  reg.present:
    - name: HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System
    - vname: ConsentPromptBehaviorAdmin
    - vtype: REG_DWORD
    - vdata: 0

wsl-set-uac-2-offline:
  reg.present:
    - name: HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System
    - vname: PromptOnSecureDesktop
    - vtype: REG_DWORD
    - vdata: 0

wsl-powershell-stager-offline:
  file.managed:
    - name: 'C:\salt\tempdownload\wsl-after-reboot.ps1'
    - source: salt://winfor/offline/wsl/wsl.ps1
    - win_inheritance: True
    - makedirs: True
    - require:
      - reg: powershell-execution-policy-offline
      - reg: powershell-execution-policy-path-offline
      - reg: wsl-set-uac-1-offline
      - reg: wsl-set-uac-2-offline

wsl-config-stager-offline:
  file.managed:
    - name: 'C:\salt\tempdownload\wsl-config.cmd'
    - source: salt://winfor/offline/wsl/wsl-config.cmd
    - win_inheritance: True
    - makedirs: True
    - require:
      - reg: powershell-execution-policy-offline
      - reg: powershell-execution-policy-path-offline
      - reg: wsl-set-uac-1-offline
      - reg: wsl-set-uac-2-offline
      - file: wsl-powershell-stager-offline

wsl-powershell-stager-customize-offline:
  file.replace:
    - name: 'C:\salt\tempdownload\wsl-after-reboot.ps1'
    - pattern: _this_user_
    - repl: {{ user }}
    - count: 1
    - require:
      - file: wsl-powershell-stager-offline
      - user: user-{{ user }}

wsl-config-stager-customize-path-offline:
  file.replace:
    - name: 'C:\salt\tempdownload\wsl-after-reboot.ps1'
    - pattern: _this_path_
    - repl: {{ inpath | regex_escape }}
    - count: 1
    - require:
      - file: wsl-powershell-stager-offline
      - file: wsl-powershell-stager-customize-offline
      - user: user-{{ user }}

wsl-config-run-on-reboot-offline:
  reg.present:
    - name: HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\RunOnce
    - vname: "WIN-FOR WSL Config"
    - vtype: REG_SZ
    - vdata: 'C:\Windows\system32\cmd.exe /q /c C:\salt\tempdownload\wsl-config.cmd'
    - require:
      - cmd: wsl-install-offline
      - cmd: vmp-install-offline
      - file: wsl-config-stager-offline
      - file: wsl-powershell-stager-offline
      - file: wsl-powershell-stager-customize-offline
      - file: wsl-config-stager-customize-path-offline

wsl-log-append-offline:
  file.append:
    - name: 'C:\winfor-saltstack-{{ version|trim }}-wsl.log'
    - text: 'GOING FOR REBOOT NOW'

system-restart-offline:
  system.reboot:
    - timeout: 0
    - in_seconds: True
    - only_on_pending_reboot: False
    - require:
      - cmd: wsl-install-offline
      - cmd: vmp-install-offline
      - file: wsl-config-stager-offline
      - file: wsl-powershell-stager-offline
      - file: wsl-powershell-stager-customize-offline
      - file: wsl-config-stager-customize-path-offline
      - reg: wsl-config-run-on-reboot-offline
