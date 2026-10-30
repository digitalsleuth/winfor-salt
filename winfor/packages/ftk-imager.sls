# Name: FTK Imager
# Website: https://www.exterro.com
# Description: Forensic Image Acquisition and Triage tool
# Category: Acquisition and Analysis
# Author: Exterro Inc / AccessData
# License: EULA
# Version: 8.3.0.27
# Notes:

{% set version = '8.3.0.27' %}
{% from 'winfor/_macros/hashes.jinja' import get_hash %}
{% set hash = get_hash('ftk-imager') %}

ftk-imager-download:
  file.managed:
    - name: 'C:\salt\tempdownload\FTK-Imager-{{ version }}.zip'
    - source: 'https://d1kpmuwb7gvu1i.cloudfront.net/{{ ".".join(version.split(".")[:2]) }}/Imager/FTK%20Imager%20{{ version }}.zip'
    - source_hash: sha256={{ hash }}
    - makedirs: True

ftk-imager-extract:
  archive.extracted:
    - name: 'C:\salt\tempdownload\'
    - source: 'C:\salt\tempdownload\FTK-Imager-{{ version }}.zip'
    - enforce_toplevel: False
    - require:
      - file: ftk-imager-download

ftk-imager-install:
  cmd.run:
    - name: '"Exterro_FTK_Imager_(x64).exe" /s /v/qn'
    - cwd: 'C:\salt\tempdownload\'
    - shell: cmd
    - require:
      - archive: ftk-imager-extract

ftk-imager-icon-remove:
  file.absent:
    - name: 'C:\Users\Public\Desktop\Exterro FTK Imager.lnk'
    - require:
      - cmd: ftk-imager-install

