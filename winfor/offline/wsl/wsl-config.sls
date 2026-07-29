{% set wsl_choice = salt['pillar.get']('wsl_choice', 'siftrem') %}
{% set PROGRAMDATA = salt['environ.get']('PROGRAMDATA') %}
{% set PROGRAM_FILES = salt['environ.get']('PROGRAMFILES') %}
{% set START_MENU = PROGRAMDATA + '\Microsoft\Windows\Start Menu' %}
{% set START_PROGRAMS = START_MENU + '\Programs' %}
{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set downloads = salt['pillar.get']('offline', 'C:\winfor-downloads') %}

include:
  - winfor.config.shims

{% for distro in ['kali', 'sift', 'siftrem', 'remnux'] %}

wsl-move-{{ distro }}-offline:
  file.rename:
    - name: '{{ inpath }}\wsl\{{ distro }}'
    - source: '{{ downloads }}\wsl\{{ distro }}\'
    - force: True
    - makedirs: True
    - onlyif:
      - fun: file.directory_exists
        path: '{{ downloads }}\wsl\{{ distro }}'

{% if distro == 'kali' %}
  {% set name = 'kali-linux' %}
{% else %}
  {% set name = distro|upper ~ '-24' %}
{% endif %}

wsl-import-{{ distro }}-offline:
  cmd.run:
    - name: 'wsl --import-in-place {{ name }} {{ inpath }}\wsl\{{ distro }}\ext4.vhdx'
    - shell: cmd
    - onlyif:
      - fun: file.file_exists
        path: '{{ inpath }}\wsl\{{ distro }}\ext4.vhdx'

wsl-shim-{{ distro }}:
  cmd.run:
    - name: |
        powershell -nop -ep Bypass -c "$wslPath = (Get-Item '{{ PROGRAM_FILES }}\WindowsApps\MicrosoftCorporationII.WindowsSubsystemForLinux_*_x64__8wekyb3d8bbwe\wsl.exe' -ErrorAction SilentlyContinue).FullName; if ($wslPath) { & '{{ inpath }}\New-Shim.ps1' -SourceExe $wslPath -OutPath '{{ inpath }}\shims\wsl.exe' }"
    - shell: cmd
    - onlyif:
      - powershell -nop -ep Bypass -c "if (Test-Path '{{ PROGRAM_FILES }}\WindowsApps\MicrosoftCorporationII.WindowsSubsystemForLinux_*_x64__8wekyb3d8bbwe') { exit 0 } else { exit 1 }"
    - unless:
      - fun: file.file_exists
        path: '{{ inpath }}\shims\wsl.exe'
    - require:
      - sls: winfor.config.shims

wsl-shortcut-{{ distro }}:
  file.shortcut:
    - name: '{{ START_PROGRAMS }}\{{ name }}.lnk'
    - target: '{{ inpath }}\shims\wsl.exe'
    - force: True
    - working_dir: '{{ inpath }}\shims'
    - icon_location: '{{ inpath }}\wsl\{{ distro }}\shortcut.ico'
    - arguments: '-d {{ name }} ~'
    - makedirs: True
    - require:
      - cmd: wsl-shim-{{ distro }}
    - onlyif:
      - fun: file.directory_exists
        path: '{{ inpath }}\wsl\{{ distro }}'

wsl-portals-shortcut-{{ distro }}:
  file.copy:
    - name: '{{ inpath }}\Portals\Terminals\{{ name }}.lnk'
    - source: '{{ START_PROGRAMS }}\{{ name }}.lnk'
    - force: True
    - makedirs: True
    - require:
      - file: wsl-shortcut-{{ distro }}
    - onlyif:
      - fun: file.file_exists
        path: '{{ START_PROGRAMS }}\{{ name }}.lnk'

{% endfor %}
