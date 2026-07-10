# Name: Velociraptor
# Website: https://docs.velociraptor.app/
# Description: DFIR live acquisition tool
# Category: Windows Analysis
# Author: Mike Cohen (scudette)
# License: GNU Affero General Public License v3 (https://github.com/Velocidex/velociraptor/blob/master/LICENSE)
# Version: 0.77.1
# Notes: 

{% set version = '0.77.1' %}
{% set hash = 'c91cf8a32731c4c45c148393bc7d2af688c392194a9fffc4535e8b583260d55e' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

velociraptor-download-only:
  file.managed:
    - name: '{{ downloads }}\velociraptor\velociraptor-{{ version }}.exe'
    - source: https://github.com/Velocidex/velociraptor/releases/download/v{{ version }}/velociraptor-v{{ version }}-windows-amd64.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True
    - replace: True
