# Name: Firefox
# Website: https://www.mozilla.org/en-US/firefox/new/
# Description: Mozilla web browser
# Category: Browsers
# Author: Mozilla Foundation
# License: Mozilla Public License 2.0 (https://www.mozilla.org/en-US/MPL/)
# Version: 118.0.1
# Notes: 

{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set version = '118.0.1' %}
{% set hash = 'a10b0d585134734d01f68b51fa92d70dfa7749b0c0966987562819c87504b679' %}

firefox_x64-download-only:
  file.managed:
    - name: '{{ downloads }}\Firefox Setup {{ version }}.exe'
    - source: https://download-installer.cdn.mozilla.net/pub/firefox/releases/{{ version }}/win64/en-US/Firefox%20Setup%20{{ version }}.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True
