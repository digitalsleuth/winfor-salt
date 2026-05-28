# Name: Desktop Fences Plus
# Website: https://github.com/limbo666/DesktopFences/
# Description: Open source alternative to Stardock Fences
# Category: Requirements
# Author: Nikos Georgousis
# License: MIT License (https://github.com/limbo666/DesktopFences/blob/main/License.md)
# Version: 2.6.6.236
# Notes: Version 2.6.6.236 is incorrectly labelled in releases

{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set version = '2.6.6.236' %}
{% set hash = '9e9c2095b6a627a0e65c39b457d3bb07ed2d798f630cafca52ffbad2a53408f7' %}
{% set PROGRAMDATA = salt['environ.get']('PROGRAMDATA') %}

include:
  - winfor.packages.dotnet8-desktop-runtime

desktop-fences-download:
  file.managed:
    - name: 'C:\salt\tempdownload\desktop-fences-{{ version }}.zip'
    - source: 'https://github.com/limbo666/DesktopFences/releases/download/{{ version }}/DesktopFences+2.6.6.234.zip'
    - source_hash: sha256={{ hash }}
    - makedirs: True
    - require:
      - sls: winfor.packages.dotnet8-desktop-runtime

desktop-fences-extract:
  archive.extracted:
    - name: '{{ inpath }}\'
    - source: 'C:\salt\tempdownload\desktop-fences-{{ version }}.zip'
    - enforce_toplevel: False
    - require:
      - file: desktop-fences-download

desktop-fences-folder-rename:
  file.rename:
    - name: '{{ inpath }}\desktop-fences'
    - source: '{{ inpath }}\Desktop Fences +'
    - require:
      - archive: desktop-fences-extract

desktop-fences-shortcut:
  file.shortcut:
    - name: '{{ PROGRAMDATA }}\Microsoft\Windows\Start Menu\Programs\Desktop Fences Plus.lnk'
    - target: '{{ inpath }}\desktop-fences\Desktop Fences.exe'
    - force: True
    - working_dir: '{{ inpath }}\desktop-fences\'
    - makedirs: True
    - require:
      - file: desktop-fences-download
      - archive: desktop-fences-extract
      - file: desktop-fences-folder-rename

desktop-fences-create-profile-folder:
  file.directory:
    - name: '{{ inpath }}\desktop-fences\Profiles\Default'
    - makedirs: True
    - require:
      - file: desktop-fences-download
      - archive: desktop-fences-extract
      - file: desktop-fences-folder-rename
