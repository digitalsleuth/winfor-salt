# Name: Velociraptor
# Website: https://docs.velociraptor.app/
# Description: DFIR live acquisition tool
# Category: Windows Analysis
# Author: Mike Cohen (scudette)
# License: GNU Affero General Public License v3 (https://github.com/Velocidex/velociraptor/blob/master/LICENSE)
# Version: 0.74.3
# Notes: 

{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set version = '0.74' %}
{% set chg_ver = '0.74.3' %}
{% set hash = '9183d559fcc2696702381bd6a2cf067a5c6fa2af05354eca99b0de39ad54f397' %}

velociraptor-download:
  file.managed:
    - name: '{{ inpath }}\velociraptor\velociraptor.exe'
    - source: https://github.com/Velocidex/velociraptor/releases/download/v{{ version }}/velociraptor-v{{ chg_ver }}-windows-amd64.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True
    - replace: True

velociraptor-env-vars:
  win_path.exists:
    - name: '{{ inpath }}\velociraptor\'
