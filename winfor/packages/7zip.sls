# Name: 7-Zip
# Website: https://7-zip.org
# Description: Zip Compiler and Extractor
# Category: Requirements
# Author: Igor Pavlov
# License: GNU LGPL (https://www.7-zip.org/faq.html)
# Version: 24.06
# Notes: 

{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set exes = ['7z', '7zFM', '7zG'] %}
include:
  - winfor.repos
  - winfor.config.shims

7zip:
  pkg.installed

{% for exe in exes %}
{{ exe }}-shim:
  cmd.run:
    - name: 'powershell -nop -ep Bypass -File {{ inpath }}\New-Shim.ps1 -SourceExe "C:\\Program Files\\7-Zip\\{{ exe }}.exe" -OutPath {{ inpath }}\shims\{{ exe }}.exe'
    - require:
      - sls: winfor.config.shims
      - pkg: 7zip
{% endfor %}
