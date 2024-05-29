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
{% set hash = '9f36bfe1dc244e7a0b3b99dad64f696d90535fa332fb228894a6c55d2a018f90' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

adobereader-download-only:
  file.managed:
    - name: '{{ downloads }}\adobe-reader\AcroRdrDC{{ versionNoDots }}_en_US.exe'
    - source: https://ardownload2.adobe.com/pub/adobe/reader/win/AcrobatDC/{{ versionNoDots }}/AcroRdrDC{{ versionNoDots }}_en_US.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True
