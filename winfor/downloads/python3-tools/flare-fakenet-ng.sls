# Name: Fakenet-NG
# Website: https://github.com/mandiant/flare-fakenet-ng
# Description: Next Generation Dynamic Network Analysis Tool
# Category: Network
# Author: https://github.com/mandiant/flare-fakenet-ng/blob/master/AUTHORS
# License: Apache License 2.0 (https://github.com/mandiant/flare-fakenet-ng/blob/master/LICENSE.txt)
# Version: 3.5
# Notes:

{% set version = '3.5' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set hash = '89d85290a570ef509b40137b6cf61895da1cebfe8b5cbe2882639461149ef7bc' %}

flare-fakenet-ng-download-only:
  file.managed:
    - name: '{{ downloads }}\flare-fakenet-ng-{{ version }}.zip'
    - source: https://github.com/mandiant/flare-fakenet-ng/releases/download/v{{ version }}/fakenet{{ version }}.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True

flare-fakenet-ng-extract-download-only:
  archive.extracted:
    - name: '{{ downloads }}\'
    - source: '{{ downloads }}\flare-fakenet-ng-{{ version }}.zip'
    - enforce_toplevel: False
    - require:
      - file: flare-fakenet-ng-download-only

flare-fakenet-ng-rename-folder-download-only:
  file.rename:
    - name: '{{ downloads }}\flare-fakenet-ng'
    - source: '{{ downloads }}\fakenet{{ version }}'
    - makedirs: True
    - require:
      - archive: flare-fakenet-ng-extract-download-only

flare-fakenet-ng-remove-archive-download-only:
  file.absent:
    - name: '{{ downloads }}\flare-fakenet-ng-{{ version }}.zip'
    - require:
      - cmd: flare-fakenet-ng-requirements-download-only
