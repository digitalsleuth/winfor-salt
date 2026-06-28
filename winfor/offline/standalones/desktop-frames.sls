# Name: Desktop Frames Plus
# Website: https://github.com/limbo666/DesktopFramesPlus/
# Description: Open source desktop icon management utility for Windows
# Category: Requirements
# Author: Nikos Georgousis
# License: MIT License (https://github.com/limbo666/DesktopFramesPlus/blob/main/License.md)
# Version: 2.7.7.294
# Notes: 

{% set version = '2.7.7.294' %}
{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set downloads = salt['pillar.get']('offline', 'C:\winfor-downloads') %}
{% set PROGRAMDATA = salt['environ.get']('PROGRAMDATA') %}

include:
  - winfor.offline.packages.dotnet8-desktop-runtime

desktop-frames-folder-exists-offline:
  file.directory:
    - name: '{{ inpath }}\desktop-frames\Profiles\Default'
    - makedirs: True
    - replace: True
    - win_inheritance: True
  
desktop-frames-extract-offline:
  archive.extracted:
    - name: '{{ inpath }}\desktop-frames'
    - source: '{{ downloads }}\desktop-frames\desktop-frames-{{ version }}.zip'
    - enforce_toplevel: False

desktop-frames-shortcut-offline:
  file.shortcut:
    - name: '{{ PROGRAMDATA }}\Microsoft\Windows\Start Menu\Programs\Desktop Frames Plus.lnk'
    - target: '{{ inpath }}\desktop-frames\Desktop Frames.exe'
    - force: True
    - working_dir: '{{ inpath }}\desktop-frames\'
    - makedirs: True
    - require:
      - archive: desktop-frames-extract-offline
      - file: desktop-frames-folder-exists-offline

desktop-frames-create-profile-folder-offline:
  file.directory:
    - name: '{{ inpath }}\desktop-frames\Profiles\Default'
    - makedirs: True
    - require:
      - archive: desktop-frames-extract-offline
      - file: desktop-frames-folder-exists-offline
