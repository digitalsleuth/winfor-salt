# Name: WSL Setup
# Website: https://microsoft.com
# Description: Windows Subsystem for Linux setup
# Category: Terminals
# Author: Microsoft
# License: EULA
# Version: 0.0
# Notes: 

{% set user = salt['pillar.get']('winfor_user', 'forensics') %}
{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}

include:
  - winfor.config.user

wsl-defender-exclusion:
  cmd.run:
    - names:
      - 'Add-MpPreference -ExclusionPath "{{ inpath }}\"'
      - 'Add-MpPreference -ExclusionPath "C:\salt\tempdownload\"'
    - shell: powershell

wsl-cleanup:
  cmd.run:
    - name: 'dism.exe /online /cleanup-image /revertpendingactions'
    - shell: cmd

wsl-install:
  dism.feature_installed:
    - name: Microsoft-Windows-Subsystem-Linux
    - restart: False
    - enable_parent: True

vmp-install:
  dism.feature_installed:
    - name: VirtualMachinePlatform
    - restart: False
    - enable_parent: True

powershell-execution-policy:
  reg.present:
    - name: HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\PowerShell\1\ShellIds\Microsoft.PowerShell
    - vname: ExecutionPolicy
    - vtype: REG_SZ
    - vdata: Bypass

powershell-execution-policy-path:
  reg.present:
    - name: HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\PowerShell\1\ShellIds\Microsoft.PowerShell
    - vname: Path
    - vtype: REG_SZ
    - vdata: 'C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe'

wsl-set-uac-1:
  reg.present:
    - name: HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System
    - vname: ConsentPromptBehaviorAdmin
    - vtype: REG_DWORD
    - vdata: 0

wsl-set-uac-2:
  reg.present:
    - name: HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System
    - vname: PromptOnSecureDesktop
    - vtype: REG_DWORD
    - vdata: 0

wsl-config-stager:
  file.managed:
    - name: 'C:\salt\tempdownload\wsl-config.cmd'
    - source: salt://winfor/wsl/wsl-config.cmd
    - win_inheritance: True
    - makedirs: True
    - require:
      - reg: powershell-execution-policy
      - reg: powershell-execution-policy-path
      - reg: wsl-set-uac-1
      - reg: wsl-set-uac-2

wsl-config-stager-customize:
  file.replace:
    - name: 'C:\salt\tempdownload\wsl-config.cmd'
    - pattern: _this_user_
    - repl: {{ user }}
    - count: 1
    - require:
      - file: wsl-config-stager
      - user: user-{{ user }}

wsl-config-stager-customize-path:
  file.replace:
    - name: 'C:\salt\tempdownload\wsl-config.cmd'
    - pattern: _this_path_
    - repl: {{ inpath | regex_escape }}
    - count: 1
    - require:
      - file: wsl-config-stager
      - file: wsl-config-stager-customize
      - user: user-{{ user }}

wsl-config-run-on-reboot:
  reg.present:
    - name: HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\RunOnce
    - vname: "WIN-FOR WSL Config"
    - vtype: REG_SZ
    - vdata: 'C:\Windows\system32\cmd.exe /q /c C:\salt\tempdownload\wsl-config.cmd'
    - require:
      - dism: wsl-install
      - dism: vmp-install
      - file: wsl-config-stager
      - file: wsl-config-stager-customize
      - file: wsl-config-stager-customize-path

wsl-log-append:
  file.append:
    - name: 'C:\winfor-wsl.log'
    - text: 'GOING FOR REBOOT NOW'

system-restart:
  system.reboot:
    - timeout: 0
    - in_seconds: True
    - only_on_pending_reboot: False
    - require:
      - dism: wsl-install
      - dism: vmp-install
      - file: wsl-config-stager
      - file: wsl-config-stager-customize
      - file: wsl-config-stager-customize-path
      - reg: wsl-config-run-on-reboot
