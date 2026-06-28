# Name: PDFXplorer
# Website: https://pdfxplorer.dev
# Description: Graphical PDF debugger
# Category: Documents / Editors
# Author: PDF4DEV
# License: Proprietary (https://pdfxplorer.dev/licensing.html)
# Version: 5.1.0
# Notes: 

{% set version = '5.1.0' %}
{% set downloads = salt['pillar.get']('offline', 'C:\winfor-downloads') %}
{% set pkg = 'pdfxplorer-'~ version ~'.msi' %}
{% set exists = salt['file.file_exists'](downloads + '\\pdfxplorer\\' + pkg) %}

{% if exists %}
pdfxplorer-install-offline:
  cmd.run:
    - name: 'msiexec /i {{ pkg }} /qn /norestart'
    - shell: cmd
    - cwd: '{{ downloads }}\pdfxplorer\'

{% else %}
{{ pkg }} does not exist - not installing:
  test.nop
{% endif %}
