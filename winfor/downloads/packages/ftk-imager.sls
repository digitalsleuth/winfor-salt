# Name: FTK Imager
# Website: https://www.exterro.com
# Description: Forensic Image Acquisition and Triage tool
# Category: Acquisition and Analysis
# Author: Exterro Inc / AccessData
# License: EULA
# Version: 8.3.0.27
# Notes:

{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set version = '8.3.0.27' %}
{% from 'winfor/_macros/hashes.jinja' import get_hash %}
{% set hash = get_hash('ftk-imager') %}

ftk-imager-download-only:
  file.managed:
    - name: '{{ downloads }}\ftk-imager\ftk-imager-{{ version }}.zip'
    - source: 'https://d1kpmuwb7gvu1i.cloudfront.net/{{ ".".join(version.split(".")[:2]) }}/Imager/FTK%20Imager%20{{ version }}.zip'
    - source_hash: sha256={{ hash }}
    - makedirs: True
