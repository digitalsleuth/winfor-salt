# Name: Velociraptor
# Website: https://docs.velociraptor.app/
# Description: DFIR live acquisition tool
# Category: Windows Analysis
# Author: Mike Cohen (scudette)
# License: GNU Affero General Public License v3 (https://github.com/Velocidex/velociraptor/blob/master/LICENSE)
# Version: 0.7.0
# Notes: 

{% set version = '0.7.0' %}
{% set chg_ver = '0.7.0-3' %}
{% set hash = 'e286e8647ac7d7fd23c10561e2f799322d6413630c0926b2e4cdf758e8c547c7' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

velociraptor-download-only:
  file.managed:
    - name: '{{ downloads }}\velociraptor\velociraptor-v{{ version }}-windows-amd64.exe'
    - source: https://github.com/Velocidex/velociraptor/releases/download/v{{ version }}/velociraptor-v{{ chg_ver }}-windows-amd64.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True
    - replace: True
