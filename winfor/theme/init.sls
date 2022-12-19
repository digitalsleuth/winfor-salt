{% set PROGRAMDATA = salt['environ.get']('PROGRAMDATA') %}
{% set hash = '24f62d8212f25e16cf384779c48876a11f8d9430b597f066d81c0df5ee8594c6' %}
{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set profile_pictures = ['user.png', 'user.bmp', 'user-32.png', 'user-40.png', 'user-48.png', 'user-192.png'] %}

winfor-theme-wallpaper-source:
  file.managed:
    - name: '{{ inpath }}\winfor-wallpaper-blue.png'
    - source: salt://winfor/theme/winfor-wallpaper-blue.png
    - source_hash: sha256={{ hash }}
    - makedirs: True
    - win_inheritance: True

winfor-theme-desktop-background-color:
  reg.present:
    - name: HKEY_CURRENT_USER\Control Panel\Colors
    - vname: Background
    - vtype: REG_SZ
    - vdata: "0 0 0"

winfor-theme-set-wallpaper:
  reg.present:
    - name: HKEY_CURRENT_USER\Control Panel\Desktop
    - vname: WallPaper
    - vtype: REG_SZ
    - vdata: '{{ inpath }}\winfor-wallpaper-blue.png'

winfor-theme-set-wallpaper-center:
  reg.present:
    - name: HKEY_CURRENT_USER\Control Panel\Desktop
    - vname: WallpaperStyle
    - vtype: REG_SZ
    - vdata: 6

winfor-theme-set-wallpaper-no-tile:
  reg.present:
    - name: HKEY_CURRENT_USER\Control Panel\Desktop
    - vname: TileWallpaper
    - vtype: REG_SZ
    - vdata: 0

winfor-theme-update-wallpaper:
  cmd.run:
    - name: 'RUNDLL32.EXE USER32.DLL,UpdatePerUserSystemParameters 1, True'
    - shell: cmd

{% for file in profile_pictures %}

winfor-theme-profile-picture-backup-{{ file }}:
  file.managed:
    - name: 'C:\ProgramData\Microsoft\User Account Pictures\{{ file }}.bak'
    - source: 'C:\ProgramData\Microsoft\User Account Pictures\{{ file }}'
    - skip_verify: True

winfor-theme-profile-picture-copy-{{ file }}:
  file.managed:
    - name: 'C:\ProgramData\Microsoft\User Account Pictures\{{ file }}'
    - source: salt://winfor/theme/{{ file }}
    - skip_verify: True
    - replace: True
    - require:
      - file: winfor-theme-profile-picture-backup-{{ file }}

{% endfor %}

winfor-theme-default-profile-picture:
  reg.present:
    - name: HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer
    - vname: UseDefaultTile
    - vtype: REG_DWORD
    - vdata: 1

nimi-taskkill:
  cmd.run:
    - name: 'taskkill /F /IM "Nimi Places.exe"'
    - bg: True

nimi-setup:
  file.managed:
    - name: 'C:\salt\tempdownload\nimi.zip'
    - source: salt://winfor/files/nimi.zip
    - makedirs: True

nimi-extract:
  archive.extracted:
    - name: '{{ inpath }}\nimi\'
    - source: 'C:\salt\tempdownload\nimi.zip'
    - enforce_toplevel: False
    - require:
      - file: nimi-setup

nimi-autostart:
  reg.present:
    - name: HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Run
    - vname: NimiPlaces
    - vtype: REG_SZ
    - vdata: '"{{ inpath }}\nimi\nimi.cmd"'

cleanup-nimi:
  file.absent:
    - name: 'C:\salt'
    - require:
      - reg: nimi-autostart

nimi-shortcut:
  file.shortcut:
    - name: '{{ PROGRAMDATA }}\Microsoft\Windows\Start Menu\Programs\Nimi Places.lnk'
    - target: '{{ inpath }}\nimi\nimi.cmd'
    - force: True
    - working_dir: '{{ inpath }}\nimi'
    - icon_location: '{{ inpath }}\nimi\Nimi Places.exe'
    - makedirs: True
    - require:
      - archive: nimi-extract
