# Name: Velociraptor
# Website: https://docs.velociraptor.app/
# Description: DFIR live acquisition tool
# Category: Windows Analysis
# Author: Mike Cohen (scudette)
# License: GNU Affero General Public License v3 (https://github.com/Velocidex/velociraptor/blob/master/LICENSE)
# Version: 0.76.1
# Notes: 

{% set version = '0.76' %}
{% set chg_ver = '0.76.1' %}
{% set hash = '1380bb6373604c68360d8eaede811cb6e19b826b4116b808907d5b9ab049ac2b' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

velociraptor-download-only:
  file.managed:
    - name: '{{ downloads }}\velociraptor\velociraptor-v{{ chg_ver }}-windows-amd64.exe'
    - source: https://github.com/Velocidex/velociraptor/releases/download/v{{ version }}/velociraptor-v{{ chg_ver }}-windows-amd64.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True
    - replace: True
