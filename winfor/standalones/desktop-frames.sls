# Name: Desktop Frames Plus
# Website: https://github.com/limbo666/DesktopFramesPlus/
# Description: Open source desktop icon management utility for Windows
# Category: Requirements
# Author: Nikos Georgousis
# License: MIT License (https://github.com/limbo666/DesktopFramesPlus/blob/main/License.md)
# Version: 2.7.7.294
# Notes: 

{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set version = '2.7.7.294' %}
{% set hash = 'ab7acde3d19b6baf1d5bd8f8095fead5d56c3dab8f6232579bbb47c9241f1772' %}
{% set PROGRAMDATA = salt['environ.get']('PROGRAMDATA') %}

include:
  - winfor.packages.dotnet8-desktop-runtime

desktop-Frames-download:
  file.managed:
    - name: 'C:\salt\tempdownload\desktop-frames-{{ version }}.zip'
    - source: 'https://github.com/limbo666/DesktopFramesPlus/releases/download/{{ version }}/DesktopFrames+.zip'
    - source_hash: sha256={{ hash }}
    - makedirs: True
    - require:
      - sls: winfor.packages.dotnet8-desktop-runtime

desktop-frames-extract:
  archive.extracted:
    - name: '{{ inpath }}\'
    - source: 'C:\salt\tempdownload\desktop-frames-{{ version }}.zip'
    - enforce_toplevel: False
    - require:
      - file: desktop-frames-download

desktop-frames-folder-rename:
  file.rename:
    - name: '{{ inpath }}\desktop-frames'
    - source: '{{ inpath }}\Desktop Frames +'
    - require:
      - archive: desktop-frames-extract

desktop-frames-shortcut:
  file.shortcut:
    - name: '{{ PROGRAMDATA }}\Microsoft\Windows\Start Menu\Programs\Desktop Frames Plus.lnk'
    - target: '{{ inpath }}\desktop-frames\Desktop Frames.exe'
    - force: True
    - working_dir: '{{ inpath }}\desktop-frames\'
    - makedirs: True
    - require:
      - file: desktop-frames-download
      - archive: desktop-frames-extract
      - file: desktop-frames-folder-rename

desktop-frames-create-profile-folder:
  file.directory:
    - name: '{{ inpath }}\desktop-frames\Profiles\Default'
    - makedirs: True
    - require:
      - file: desktop-frames-download
      - archive: desktop-frames-extract
      - file: desktop-frames-folder-rename
