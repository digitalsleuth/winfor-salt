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
{% set pkg = 'importexcel-'~ version ~'.nupkg' %}
{% set zip = pkg.replace(".nupkg", ".zip") %}
{% set exists = salt['file.file_exists'](downloads + '\\importexcel\\' + pkg) %}

{% if exists %}

importexcel-rename-file-offline:
  file.rename:
    - name: '{{ downloads }}\importexcel\{{ zip }}'
    - source: '{{ downloads }}\importexcel\{{ pkg }}'
    - force: True

importexcel-module-folder-offline:
  cmd.run:
    - name: New-Item -ItemType Directory -Force -Path "{{ path }}"
    - shell: powershell
    - unless:
      - fun: file.file_exists
        path: {{ path }}\ImportExcel.psd1
    - require:
      - file: importexcel-rename-file-offline

importexcel-module-extract-offline:
  cmd.run:
    - name: Expand-Archive -Path "{{ downloads }}\importexcel\{{ zip }}" -DestinationPath "{{ path }}"
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
{% else %}
{{ pkg }} does not exist - not installing:
  test.nop
{% endif %}
