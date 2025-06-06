# Name: Firefox
# Website: https://www.mozilla.org/en-US/firefox/new/
# Description: Mozilla web browser
# Category: Browsers
# Author: Mozilla Foundation
# License: Mozilla Public License 2.0 (https://www.mozilla.org/en-US/MPL/)
# Version: 139.0.1
# Notes: 

{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set version = '139.0.1' %}
{% set hash = 'a147fd3f16540993628dba44a0d21f8f3fef6042d58c5356cc1dbb5ad6a7f1e2' %}

firefox_x64-download-only:
  file.managed:
    - name: '{{ downloads }}\firefox\Firefox Setup {{ version }}.exe'
    - source: https://download-installer.cdn.mozilla.net/pub/firefox/releases/{{ version }}/win64/en-US/Firefox%20Setup%20{{ version }}.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True
