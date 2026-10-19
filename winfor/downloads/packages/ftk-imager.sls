# Name: FTK Imager
# Website: https://www.exterro.com
# Description: Forensic Image Acquisition and Triage tool
# Category: Acquisition and Analysis
# Author: Exterro Inc / AccessData
# License: EULA
# Version: 4.7.3.81
# Notes:

{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set version = '4.7.3.81' %}
{% from 'winfor/_macros/hashes.jinja' import get_hash %}
{% set hash = get_hash('ftk-imager') %}

ftk-imager-download-only:
  file.managed:
    - name: '{{ downloads }}\ftk-imager\ftk-imager-{{ version }}.exe'
    - source: https://d1kpmuwb7gvu1i.cloudfront.net/Imgr/{{ version }}%20Release/Exterro_FTK_Imager_%28x64%29-{{ version }}.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True
