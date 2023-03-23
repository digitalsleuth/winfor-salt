# Name: Adobe Reader DC Classic
# Website: https://www.adobe.com
# Description: Adobe PDF Document Reader
# Category: Requirements
# Author: Adobe
# License: https://helpx.adobe.com/ca/reader/acrobat-copyright-trademarks-third-party-notices.html
# Version: 22.003.20282
# Notes: 

{% set version = '22.003.20282' %}
{% set versionNoDots = version | replace(".","") %}
{% set hash = '81907a894a84391103efd924620f4891a89c68e8a5ad6c6d4cbf4f1692333fef' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

adobereader-download-only:
  file.managed:
    - name: '{{ downloads }}\AcroRdrDC{{ versionNoDots }}_en_US.exe'
    - source: https://ardownload2.adobe.com/pub/adobe/reader/win/AcrobatDC/{{ versionNoDots }}/AcroRdrDC{{ versionNoDots }}_en_US.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True
