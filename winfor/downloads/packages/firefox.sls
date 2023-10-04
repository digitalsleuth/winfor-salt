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
{% set hash = '8d1f674979d137089cab8ba6f8773aa51262492a1d08e87c81785c04944f75f9' %}

firefox_x64-download-only:
  file.managed:
    - name: '{{ downloads }}\Firefox Setup {{ version }}.exe'
    - source: https://download-installer.cdn.mozilla.net/pub/firefox/releases/{{ version }}/win64/en-US/Firefox%20Setup%20{{ version }}.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True
