# Name: Desktop Fences Plus
# Website: https://github.com/limbo666/DesktopFences/
# Description: Open source alternative to Stardock Fences
# Category: Requirements
# Author: Nikos Georgousis
# License: MIT License (https://github.com/limbo666/DesktopFences/blob/main/License.md)
# Version: 2.6.6.236
# Notes: Version 2.6.6.236 is incorrectly labelled in releases

{% set version = '2.6.6.236' %}
{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set downloads = salt['pillar.get']('offline', 'C:\winfor-downloads') %}
{% set PROGRAMDATA = salt['environ.get']('PROGRAMDATA') %}

include:
  - winfor.offline.packages.dotnet8-desktop-runtime

desktop-fences-extract-offline:
  archive.extracted:
    - name: '{{ inpath }}\'
    - source: '{{ downloads }}\desktop-fences\desktop-fences-{{ version }}.zip'
    - enforce_toplevel: False

desktop-fences-folder-rename-offline:
  file.rename:
    - name: '{{ inpath }}\desktop-fences'
    - source: '{{ inpath }}\Desktop Fences +'
    - require:
      - archive: desktop-fences-extract-offline

desktop-fences-shortcut-offline:
  file.shortcut:
    - name: '{{ PROGRAMDATA }}\Microsoft\Windows\Start Menu\Programs\Desktop Fences Plus.lnk'
    - target: '{{ inpath }}\desktop-fences\Desktop Fences.exe'
    - force: True
    - working_dir: '{{ inpath }}\desktop-fences\'
    - makedirs: True
    - require:
      - archive: desktop-fences-extract-offline
      - file: desktop-fences-folder-rename-offline

desktop-fences-create-profile-folder-offline:
  file.directory:
    - name: '{{ inpath }}\desktop-fences\Profiles\Default'
    - makedirs: True
    - require:
      - archive: desktop-fences-extract-offline
      - file: desktop-fences-folder-rename-offline
