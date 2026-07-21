{% set PROGRAMDATA = salt['environ.get']('PROGRAMDATA') %}
{% set PROGRAM_FILES = salt['environ.get']('PROGRAMFILES') %}
{% set START_MENU = PROGRAMDATA + '\Microsoft\Windows\Start Menu\Programs' %}
{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set wslver = '2.7.10.0' %}
{% set distro = 'LIN-FOR-24' %}

include:
  - winfor.config.shims

wsl-config-version-offline:
  cmd.run:
    - name: 'wsl --set-default-version 2'
    - shell: cmd

wsl-make-install-directory-offline:
  file.directory:
    - name: '{{ inpath }}\lin-for\'
    - win_inheritance: True
    - makedirs: True
    - unless:
      - fun: file.file_exists
        path: '{{ inpath }}\lin-for\ext4.vhdx'

wsl-install-distro-offline:
  cmd.run:
    - name: 'wsl --import LIN-FOR-24 {{ inpath }}\lin-for\ {{ downloads }}\lin-for\LIN-FOR-24.tar'
    - shell: cmd
    - require:
      - file: wsl-make-install-directory-offline
      - cmd: wsl-config-version-offline
    - unless:
      - fun: file.file_exists
        path: '{{ inpath }}\lin-for\ext4.vhdx'

wsl-shim-offline:
  cmd.run:
    - name: 'powershell -nop -ep Bypass -File {{ inpath }}\New-Shim.ps1 -SourceExe '{{ PROGRAM_FILES }}\WindowsApps\MicrosoftCorporationII.WindowsSubsystemForLinux_{{ wslver }}_x64__8wekyb3d8bbwe\wsl.exe' -OutPath {{ inpath }}\shims\wsl.exe'
    - shell: cmd
    - onlyif:
      - fun: file.directory_exists
        path: '{{ PROGRAM_FILES }}\WindowsApps\MicrosoftCorporationII.WindowsSubsystemForLinux_{{ wslver }}_x64__8wekyb3d8bbwe\'
    - require:
      - sls: winfor.config.shims

wsl-shortcut-offline:
  file.shortcut:
    - name: '{{ PROGRAMDATA }}\Microsoft\Windows\Start Menu\Programs\Windows Subsystem for Linux.lnk'
    - target: '{{ inpath }}\shims\wsl.exe'
    - force: True
    - working_dir: '{{ inpath }}\shims'
    - icon_location: '{{ inpath }}\shims\wsl.exe'
    - arguments: '~'
    - makedirs: True
    - require:
      - cmd: wsl-shim-offline

wsl-portals-shortcut-offline:
  file.copy:
    - name: '{{ inpath }}\Portals\Terminals\'
    - source: '{{ START_MENU }}\Windows Subsystem for Linux.lnk'
    - preserve: True
    - subdir: True
    - makedirs: True
    - require:
      - cmd: wsl-shim-offline
