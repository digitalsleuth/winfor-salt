# Name: PDFXplorer
# Website: https://pdfxplorer.dev
# Description: Graphical PDF debugger
# Category: Documents / Editors
# Author: PDF4DEV
# License: Proprietary (https://pdfxplorer.dev/licensing.html)
# Version: 5.1.0
# Notes: 

{% set version = "5.1.0" %}
{% set PROGRAMDATA = salt["environ.get"]("PROGRAMDATA") %}
{% set PROGRAMFILESX86 = salt['environ.get']('PROGRAMFILES(x86)') %}

pdfxplorer:
  pkg.installed

pdfxplorer-shortcut:
  file.shortcut:
    - name: '{{ PROGRAMDATA }}\Microsoft\Windows\Start Menu\Programs\PDFXplorer.lnk'
    - target: '{{ PROGRAMFILESX86 }}\PDF4DEV Solutions\PDFXplorer {{ version }}\Bin\PDF4DEV.Applications.PDFXplorer.exe'
    - force: True
    - working_dir: '{{ PROGRAMFILESX86 }}\PDF4DEV Solutions\PDFXplorer {{ version }}'
    - makedirs: True
    - require:
      - pkg: pdfxplorer
