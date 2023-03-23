# Name: Firefox
# Website: https://www.mozilla.org/en-US/firefox/new/
# Description: Mozilla web browser
# Category: Browsers
# Author: Mozilla Foundation
# License: Mozilla Public License 2.0 (https://www.mozilla.org/en-US/MPL/)
# Version: 107.0.1
# Notes: 

{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set version = '107.0.1' %}
{% set hash = '5e4f166f31450276b90a8063c16763872fa823b2bd86e4e0112f9b34a23f2023' %}

firefox_x64-download-only:
  file.managed:
    - name: '{{ downloads }}\Firefox Setup {{ version }}.exe'
    - source: https://download-installer.cdn.mozilla.net/pub/firefox/releases/{{ version }}/win64/en-US/Firefox%20Setup%20{{ version }}.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True
