# Name: ZAPiXDESK
# Website: https://github.com/kraftdenker/ZAPiXDESK
# Description: PowerShell script for acquiring and decrypting WhatsApp Desktop
# Category: Acquisition and Analysis
# Author: Alberto Magno and Corey Forman (digitalsleuth)
# License: GNU General Public License v3.0 (https://github.com/kraftdenker/ZAPiXDESK/blob/main/LICENSE)
# Version: 2.1
# Notes:

{% set version = '2.1' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set hash = '7d3076acbea05d050efe6d3bf0e0f48bae9792e4b2bbd104e98e84f3513ad2b2' %}

zapixdesk-download-only:
  file.managed:
    - name: '{{ downloads }}\zapixdesk-{{ version }}.zip'
    - source: https://github.com/kraftdenker/ZAPiXDESK/archive/refs/heads/main.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True

zapixdesk-extract-download-only:
  archive.extracted:
    - name: '{{ downloads }}\'
    - source: '{{ downloads }}\zapixdesk-{{ version }}.zip'
    - enforce_toplevel: False
    - require:
      - file: zapixdesk-download-only

zapixdesk-folder-rename-download-only:
  file.rename:
    - name: '{{ downloads }}\zapixdesk'
    - source: '{{ downloads }}\ZAPiXDESK-main\'
    - force: True
    - makedirs: True
    - require:
      - archive: zapixdesk-extract-download-only

zapixdesk-remove-download-only:
  file.absent:
    - name: '{{ downloads }}\zapixdesk-{{ version }}.zip'
    - require:
      - archive: zapixdesk-extract-download-only
