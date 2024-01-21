# Name: MSI Viewer
# Website: https://github.com/wjk/MSIExtractApp
# Description: Tool for viewing and extracting MSI installers
# Category: Installers
# Author: William Kent
# License: MIT (https://github.com/wjk/MSIExtractApp/blob/main/LICENSE)
# Version: 2.0.1
# Notes: Installed via winget

{% set version = '2.0.1' %}
{% set PROGRAMDATA = salt['environ.get']('PROGRAMDATA') %}
{% set PROGRAM_FILES = salt['environ.get']('PROGRAMFILES') %}

include:
  - winfor.installers.windows-winget

msiviewer-install:
  cmd.run:
    - name: 'winget install --silent -e --id "9MZTR9QS01GN" --accept-source-agreements --accept-package-agreements'
    - shell: cmd
    - success_retcodes: 2316632107
    - require:
      - sls: winfor.installers.windows-winget

msiviewer-shortcut:
  file.shortcut:
    - name: '{{ PROGRAMDATA }}\Microsoft\Windows\Start Menu\Programs\MSI Viewer.lnk'
    - target: '{{ PROGRAM_FILES }}\WindowsApps\40885WilliamKent2015.MSIViewer_2.0.1.0_x64__vv14yhe95nw30\MSIExtract\MSIExtract.exe'
    - force: True
    - working_dir: '{{ PROGRAM_FILES }}\WindowsApps\40885WilliamKent2015.MSIViewer_2.0.1.0_x64__vv14yhe95nw30\MSIExtract\'
    - icon_location: '{{ PROGRAM_FILES }}\WindowsApps\40885WilliamKent2015.MSIViewer_2.0.1.0_x64__vv14yhe95nw30\MSIExtract\MSIExtract.exe'
    - require:
      - cmd: msiviewer-install
