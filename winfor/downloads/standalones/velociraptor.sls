# Name: Velociraptor
# Website: https://docs.velociraptor.app/
# Description: DFIR live acquisition tool
# Category: Windows Analysis
# Author: Mike Cohen (scudette)
# License: GNU Affero General Public License v3 (https://github.com/Velocidex/velociraptor/blob/master/LICENSE)
# Version: 0.6.7-5
# Notes: 

{% set version = '0.6.7-5' %}
{% set chg_ver = '0.6.7' %}
{% set hash = 'a70a88cf3c039b95bb50895e1bb4adcd826b605341b539e03bebac034952249a' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

velociraptor-download-only:
  file.managed:
    - name: '{{ downloads }}\velociraptor-v{{ version }}-windows-amd64.exe'
    - source: https://github.com/Velocidex/velociraptor/releases/download/v{{ version }}/velociraptor-v{{ chg_ver }}-windows-amd64.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True
    - replace: True
