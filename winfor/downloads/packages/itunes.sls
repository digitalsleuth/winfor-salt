# Name: Apple iTunes
# Website: https://www.apple.com
# Description: Media viewer and Apple device manager
# Category: Utilities
# Author: Apple
# License: EULA
# Version: 12.11.3.17
# Notes:

{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set version = '12.11.3.17' %}
{% set hash = '07c0c72f364f8c5ffdc4a4d60ddba7081fa82971eabcfcb25d4e6b223690527a' %}

itunes-download-only:
  file.managed:
    - name: '{{ downloads }}\iTunes64Setup.exe'
    - source: https://secure-appldnld.apple.com/itunes12/001-97787-20210421-F0E5A3C2-A2C9-11EB-A40B-A128318AD179/iTunes64Setup.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True
