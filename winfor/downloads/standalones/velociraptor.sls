# Name: Velociraptor
# Website: https://docs.velociraptor.app/
# Description: DFIR live acquisition tool
# Category: Windows Analysis
# Author: Mike Cohen (scudette)
# License: GNU Affero General Public License v3 (https://github.com/Velocidex/velociraptor/blob/master/LICENSE)
# Version: 0.75.6
# Notes: 

{% set version = '0.75' %}
{% set chg_ver = '0.75.6' %}
{% set hash = '09e6c312c5003e4326e3f71cb2d06a596826b50a911aabe76925790f95e67c33' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

velociraptor-download-only:
  file.managed:
    - name: '{{ downloads }}\velociraptor\velociraptor-v{{ version }}-windows-amd64.exe'
    - source: https://github.com/Velocidex/velociraptor/releases/download/v{{ version }}/velociraptor-v{{ chg_ver }}-windows-amd64.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True
    - replace: True
