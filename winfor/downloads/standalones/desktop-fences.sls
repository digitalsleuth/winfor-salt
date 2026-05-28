# Name: Desktop Fences Plus
# Website: https://github.com/limbo666/DesktopFences/
# Description: Open source alternative to Stardock Fences
# Category: Requirements
# Author: Nikos Georgousis
# License: MIT License (https://github.com/limbo666/DesktopFences/blob/main/License.md)
# Version: 2.6.6.236
# Notes: Version 2.6.6.236 is incorrectly labelled in releases

{% set version = '2.6.6.236' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set hash = '9e9c2095b6a627a0e65c39b457d3bb07ed2d798f630cafca52ffbad2a53408f7' %}

include:
  - winfor.downloads.packages.dotnet8-desktop-runtime

desktop-fences-download-only:
  file.managed:
    - name: '{{ downloads }}\desktop-fences\desktop-fences-{{ version }}.zip'
    - source: 'https://github.com/limbo666/DesktopFences/releases/download/{{ version }}/DesktopFences+2.6.6.234.zip'
    - source_hash: sha256={{ hash }}
    - makedirs: True
    - require:
      - sls: winfor.downloads.packages.dotnet8-desktop-runtime
