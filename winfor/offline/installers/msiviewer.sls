# Name: MSI Viewer
# Website: https://github.com/wjk/MSIExtractApp
# Description: Tool for viewing and extracting MSI installers
# Category: Installers
# Author: William Kent
# License: MIT (https://github.com/wjk/MSIExtractApp/blob/main/LICENSE)
# Version: 3.0.1
# Notes:

{% set version = '3.0.1' %}
"MSIViewer {{ version }} cannot be installed in offline mode at this time.":
  test.nop
{#
{% set downloads = salt['pillar.get']('offline', 'C:\winfor-downloads') %}
{% set PROGRAMDATA = salt['environ.get']('PROGRAMDATA') %}
{% set PROGRAM_FILES = salt['environ.get']('PROGRAMFILES') %}

msiviewer-install-offline:
  cmd.run:
    - name: 'Add-AppPackage -Path {{ downloads }}\msiviewer\MSIViewer_{{ version }}_Sideload.msixbundle'
    - shell: powershell

msiviewer-shortcut-offline:
  file.shortcut:
    - name: '{{ PROGRAMDATA }}\Microsoft\Windows\Start Menu\Programs\MSI Viewer.lnk'
    - target: '{{ PROGRAM_FILES }}\WindowsApps\40885WilliamKent2015.MSIViewer_{{ version }}.0_x64__vv14yhe95nw30\MSIExtract\MSIExtract.exe'
    - force: True
    - working_dir: '{{ PROGRAM_FILES }}\WindowsApps\40885WilliamKent2015.MSIViewer_{{ version }}.0_x64__vv14yhe95nw30\MSIExtract\'
    - icon_location: '{{ PROGRAM_FILES }}\WindowsApps\40885WilliamKent2015.MSIViewer_{{ version }}.0_x64__vv14yhe95nw30\MSIExtract\MSIExtract.exe'
    - require:
      - cmd: msiviewer-install-offline
#}
