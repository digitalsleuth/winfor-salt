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
{% set pkg = 'desktop-frames-'~ version ~'.zip' %}
{% set exists = salt['file.file_exists'](downloads + '\\desktop-frames\\' + pkg) %}

{% if exists %}

include:
  - winfor.offline.packages.dotnet8-desktop-runtime

desktop-frames-folder-exists-offline:
  file.directory:
    - name: '{{ inpath }}\desktop-frames\Profiles\Default'
    - makedirs: True
    - replace: False
    - win_inheritance: True
  
desktop-frames-extract-offline:
  archive.extracted:
    - name: '{{ inpath }}\desktop-frames'
    - source: '{{ downloads }}\desktop-frames\{{ pkg }}'
    - enforce_toplevel: False
    - require:
      - sls: winfor.offline.packages.dotnet8-desktop-runtime

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

{% else %}
{{ pkg }} does not exist - not installing:
  test.nop
{% endif %}
