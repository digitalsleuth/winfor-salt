# Name: Firefox
# Website: https://www.mozilla.org/en-US/firefox/new/
# Description: Mozilla web browser
# Category: Browsers
# Author: Mozilla Foundation
# License: Mozilla Public License 2.0 (https://www.mozilla.org/en-US/MPL/)
# Version: 150.0
# Notes: 

{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set version = '150.0' %}
{% set hash = '7029e4b01635fcc24ca553a292af99d88ba11e502c45c12f1a4b9c10c3757076' %}

firefox_x64-download-only:
  file.managed:
    - name: '{{ downloads }}\firefox\Firefox Setup {{ version }}.exe'
    - source: https://download-installer.cdn.mozilla.net/pub/firefox/releases/{{ version }}/win64/en-US/Firefox%20Setup%20{{ version }}.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True
