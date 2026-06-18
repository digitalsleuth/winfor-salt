# Name: Desktop Frames Plus
# Website: https://github.com/limbo666/DesktopFramesPlus/
# Description: Open source desktop icon management utility for Windows
# Category: Requirements
# Author: Nikos Georgousis
# License: MIT License (https://github.com/limbo666/DesktopFramesPlus/blob/main/License.md)
# Version: 2.7.7.294
# Notes: 

{% set version = '2.7.7.294' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set hash = 'ab7acde3d19b6baf1d5bd8f8095fead5d56c3dab8f6232579bbb47c9241f1772' %}

include:
  - winfor.downloads.packages.dotnet8-desktop-runtime

desktop-frames-download-only:
  file.managed:
    - name: '{{ downloads }}\desktop-frames\desktop-frames-{{ version }}.zip'
    - source: 'https://github.com/limbo666/DesktopFramesPlus/releases/download/{{ version }}/DesktopFrames+.zip'
    - source_hash: sha256={{ hash }}
    - makedirs: True
    - require:
      - sls: winfor.downloads.packages.dotnet8-desktop-runtime
