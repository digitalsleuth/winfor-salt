# Name: ImportExcel
# Website: https://github.com/dfinke/ImportExcel
# Description: Powershell Module for working with Excel documents
# Category: Utilities
# Author: Doug Finke
# License: Apache License v2.0 (https://github.com/dfinke/ImportExcel/blob/master/LICENSE.txt)
# Version: 7.8.10
# Notes:

{% set version = '7.8.10' %}
{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set downloads = salt['pillar.get']('offline', 'C:\winfor-downloads') %}
{% set path = "C:\\Program Files\\WindowsPowerShell\\Modules\\ImportExcel\\" + version %}
{% set files = ['_rels', 'package', '[Content_Types].xml'] %}

importexcel-copy-file:
  file.copy:
    - name: '{{ downloads }}\importexcel\importexcel.{{ version }}.zip'
    - source: '{{ downloads }}\importexcel\importexcel.{{ version }}.nupkg'
    - force: True

importexcel-module-folder-offline:
  cmd.run:
    - name: New-Item -ItemType Directory -Force -Path "{{ path }}"
    - shell: powershell
    - unless:
      - fun: file.file_exists
        path: {{ path }}\ImportExcel.psd1
    - require:
      - file: importexcel-copy-file

importexcel-module-extract-offline:
  cmd.run:
    - name: Expand-Archive -Path "{{ downloads }}\importexcel\importexcel.{{ version }}.zip" -DestinationPath "{{ path }}"
    - shell: powershell
    - unless:
      - fun: file.file_exists
        path: {{ path }}\ImportExcel.psd1
    - require:
      - cmd: importexcel-module-folder-offline

importexcel-module-import-offline:
  cmd.run:
    - name: Import-Module ImportExcel
    - shell: powershell

{% for file in files %}

importexcel-remove-{{ file }}:
  file.absent:
    - name: {{ path }}\{{ file }}

{% endfor %}
