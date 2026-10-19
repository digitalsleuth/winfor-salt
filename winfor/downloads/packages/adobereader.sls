# Name: Adobe Reader DC Classic
# Website: https://www.adobe.com
# Description: Adobe PDF Document Reader
# Category: Requirements
# Author: Adobe
# License: https://helpx.adobe.com/ca/reader/acrobat-copyright-trademarks-third-party-notices.html
# Version: 24.002.20759
# Notes: 

{% set version = '24.002.20759' %}
{% set versionNoDots = version | replace(".","") %}
{% from 'winfor/_macros/hashes.jinja' import get_hash %}
{% set hash = get_hash('adobereader') %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

adobereader-download-only:
  file.managed:
    - name: '{{ downloads }}\adobe-reader\adobe-reader-{{ version }}.exe'
    - source: https://ardownload2.adobe.com/pub/adobe/reader/win/AcrobatDC/{{ versionNoDots }}/AcroRdrDC{{ versionNoDots }}_en_US.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True
