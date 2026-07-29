# Name: WSL Setup
# Website: https://microsoft.com
# Description: Windows Subsystem for Linux setup
# Category: Terminals
# Author: Microsoft
# License: EULA
# Version: 0.0
# Notes: 

{% set wsl_choice = salt['pillar.get']('wsl_choice', 'siftrem') %}
{% set saltpath = salt['pillar.get']('saltpath', 'C:\Program Files\Salt Project\Salt\salt-call.exe') %}
{% if wsl_choice == 'remnux' %}
  {% set wsl_text = 'REMnux' %}
{% elif wsl_choice == 'sift' %}
  {% set wsl_text = 'SIFT' %}
{% elif wsl_choice == 'kali' %}
  {% set wsl_text = 'Kali' %}
{% elif wsl_choice == 'siftrem' %}
  {% set wsl_text = 'SIFT and REMnux' %}
{% else %}
  {% set wsl_text = 'SIFT, REMnux, and Kali' %}
{% endif %} 
{% set user = salt['pillar.get']('winfor_user', 'forensics') %}
{% set home = "C:\\Users\\" + user %}
{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set downloads = salt['pillar.get']('offline', 'C:\winfor-downloads') %}
{% set version = salt['cp.get_file_str']("C:\ProgramData\Salt Project\Salt\srv\salt\winfor\VERSION") %}
{% set PROGRAMDATA = salt['environ.get']('PROGRAMDATA') %}
{% set defender_status = salt['cmd.powershell']('((Get-Service) -match "WinDefend").Name') %}
{% set installed_features = salt['dism.installed_features']() %}
{% set wsl_status = salt['cmd.run_all']('wsl --status') %}
{% set wsl_installed = (wsl_status['retcode'] == 0) %}
{% set vmp_enabled = 'VirtualMachinePlatform' in installed_features %}

{% if wsl_installed and vmp_enabled %}
include:
  - winfor.offline.wsl.wsl-config

wsl-default-version-wsl-installed-offline:
  cmd.run:
    - name: 'wsl --set-default-version 2'
    - shell: cmd

Importing {{ wsl_text }}:
  test.nop:
    - require:
      - sls: winfor.offline.wsl.wsl-config

{% else %}

include:
  - winfor.config.user

{% if defender_status.lower() == "windefend" %}
wsl-defender-exclusion:
  cmd.run:
    - names:
      - 'echo "Defender is present on this system."'
      - 'Add-MpPreference -ExclusionPath "{{ inpath }}"'
      - 'Add-MpPreference -ExclusionPath "{{ downloads }}"'
      - 'Add-MpPreference -ExclusionPath "{{ PROGRAMDATA }}\Salt Project\Salt\var"'
    - shell: powershell

{% else %}

"Defender is not present on this system - no exclusions are required to install WSL for WIN-FOR offline.":
  test.nop

{% endif %}

wsl-install:
  cmd.run:
    - name: 'wsl --install --no-distribution'
    - shell: cmd
    - success_retcodes: 3010

wsl-default-version-offline:
  cmd.run:
    - name: 'wsl --set-default-version 2'
    - shell: cmd

wsl-shutdown-after-install-offline:
  cmd.run:
    - name: 'wsl --shutdown'
    - shell: cmd
    - require:
      - cmd: wsl-default-version-offline

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
    - name: '{{ inpath }}\wsl\wsl-after-reboot.ps1'
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
    - name: '{{ inpath }}\wsl\wsl-config.cmd'
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
    - name: '{{ inpath }}\wsl\wsl-after-reboot.ps1'
    - pattern: _this_user_
    - repl: {{ user }}
    - count: 1
    - require:
      - file: wsl-powershell-stager-offline
      - user: user-{{ user }}

wsl-powershell-stager-customize-path-offline:
  file.replace:
    - name: '{{ inpath }}\wsl\wsl-after-reboot.ps1'
    - pattern: _this_path_
    - repl: {{ inpath | regex_escape }}
    - count: 1
    - require:
      - file: wsl-powershell-stager-offline
      - file: wsl-powershell-stager-customize-offline
      - user: user-{{ user }}

wsl-powershell-stager-customize-pillar-offline:
  file.replace:
    - name: '{{ inpath }}\wsl\wsl-after-reboot.ps1'
    - pattern: _this_choice_
    - repl: {{ wsl_choice | regex_escape }}
    - count: 1
    - require:
      - file: wsl-powershell-stager-offline
      - file: wsl-powershell-stager-customize-offline
      - file: wsl-powershell-stager-customize-path-offline
      - user: user-{{ user }}

wsl-powershell-stager-customize-title-offline:
  file.replace:
    - name: '{{ inpath }}\wsl\wsl-after-reboot.ps1'
    - pattern: _this_distro_
    - repl: {{ wsl_text }}
    - count: 1
    - require:
      - file: wsl-powershell-stager-offline
      - file: wsl-powershell-stager-customize-offline
      - file: wsl-powershell-stager-customize-path-offline
      - file: wsl-powershell-stager-customize-pillar-offline
      - user: user-{{ user }}

wsl-powershell-stager-customize-offline-pillar-offline:
  file.replace:
    - name: '{{ inpath }}\wsl\wsl-after-reboot.ps1'
    - pattern: _this_offline_
    - repl: '{{ inpath | replace("\\", "\\\\") }}'
    - count: 1
    - require:
      - file: wsl-powershell-stager-offline
      - file: wsl-powershell-stager-customize-offline
      - file: wsl-powershell-stager-customize-path-offline
      - file: wsl-powershell-stager-customize-pillar-offline
      - file: wsl-powershell-stager-customize-title-offline

wsl-powershell-stager-customize-salt-exe-offline:
  file.replace:
    - name: '{{ inpath }}\wsl\wsl-after-reboot.ps1'
    - pattern: _salt_exe_
    - repl: '{{ saltpath | replace("\\", "\\\\") }}'
    - count: 1
    - require:
      - file: wsl-powershell-stager-offline
      - file: wsl-powershell-stager-customize-offline
      - file: wsl-powershell-stager-customize-path-offline
      - file: wsl-powershell-stager-customize-pillar-offline
      - file: wsl-powershell-stager-customize-title-offline

wsl-cmd-stager-offline:
  file.replace:
    - name: '{{ inpath }}\wsl\wsl-config.cmd'
    - pattern: _this_path_
    - repl: '{{ inpath | replace("\\", "\\\\") }}\\wsl'
    - count: 1
    - require:
      - file: wsl-powershell-stager-offline
      - file: wsl-powershell-stager-customize-offline
      - file: wsl-powershell-stager-customize-path-offline
      - file: wsl-powershell-stager-customize-pillar-offline
      - file: wsl-powershell-stager-customize-offline-pillar-offline
      - file: wsl-powershell-stager-customize-salt-exe-offline

wsl-config-run-on-reboot-offline:
  reg.present:
    - name: HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\RunOnce
    - vname: "WIN-FOR WSL Config"
    - vtype: REG_SZ
    - vdata: 'C:\Windows\system32\cmd.exe /q /c {{ inpath }}\wsl\wsl-config.cmd'
    - require:
      - file: wsl-config-stager-offline
      - file: wsl-cmd-stager-offline
      - file: wsl-powershell-stager-offline
      - file: wsl-powershell-stager-customize-offline
      - file: wsl-powershell-stager-customize-path-offline
      - file: wsl-powershell-stager-customize-title-offline

wsl-log-append-offline:
  file.append:
    - name: 'C:\winfor-saltstack-{{ version|trim }}-offline-wsl.log'
    - text: 'GOING FOR REBOOT NOW'
    - require:
      - reg: wsl-config-run-on-reboot-offline

system-restart-offline:
  system.reboot:
    - timeout: 0
    - in_seconds: True
    - only_on_pending_reboot: False
    - require:
      - file: wsl-config-stager-offline
      - file: wsl-powershell-stager-offline
      - file: wsl-powershell-stager-customize-offline
      - file: wsl-powershell-stager-customize-path-offline
      - file: wsl-powershell-stager-customize-pillar-offline
      - file: wsl-powershell-stager-customize-title-offline
      - reg: wsl-config-run-on-reboot-offline

{% endif %}
