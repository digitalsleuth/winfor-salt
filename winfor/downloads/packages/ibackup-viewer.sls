# Name: iBackup Viewer
# Website: https://www.imactools.com
# Description: View iDevice backups on Windows
# Category: Mobile Analysis
# Author: iMacTools
# License: Free (No specific license)
# Version: 4.27.30.0
# Notes: 

{% set version = '4.27.30.0' %}
{% from 'winfor/_macros/hashes.jinja' import get_hash %}
{% set hash = get_hash('ibackup-viewer') %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

ibackup-viewer-download-only:
  file.managed:
    - name: '{{ downloads }}\ibackup-viewer\ibackup-viewer-{{ version }}.exe'
    - source: https://www.imactools.com/download/iBackupViewerSetup.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True
