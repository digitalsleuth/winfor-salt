# Name: Adobe Reader DC Classic
# Website: https://www.adobe.com
# Description: Adobe PDF Document Reader
# Category: Requirements
# Author: Adobe
# License: https://helpx.adobe.com/ca/reader/acrobat-copyright-trademarks-third-party-notices.html
# Version: 23.006.20320
# Notes: 

{% set version = '23.006.20320' %}
{% set versionNoDots = version | replace(".","") %}
{% set hash = '6c2e57820d298fdef5b4fc3921052ec1d609f6698252aecaecfa7f7a8b101b1d' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

adobereader-download-only:
  file.managed:
    - name: '{{ downloads }}\adobe-reader\AcroRdrDC{{ versionNoDots }}_en_US.exe'
    - source: https://ardownload2.adobe.com/pub/adobe/reader/win/AcrobatDC/{{ versionNoDots }}/AcroRdrDC{{ versionNoDots }}_en_US.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True
