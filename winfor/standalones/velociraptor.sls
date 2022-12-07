# Name: Velociraptor
# Website: https://docs.velociraptor.app/
# Description: DFIR live acquisition tool
# Category: Windows Analysis
# Author: Mike Cohen (scudette)
# License: GNU Affero General Public License v3 (https://github.com/Velocidex/velociraptor/blob/master/LICENSE)
# Version: 0.6.7-4
# Notes: 

{% set version = '0.6.7-4' %}
{% set hash = '212967F6C5333BB0E733EAC5890DE6B1C0583D7C72937B67A95617B75C6AE90F' %}

velociraptor-download:
  file.managed:
    - name: 'C:\standalone\velociraptor\velociraptor-v{{ version }}-windows-amd64.exe'
    - source: https://github.com/Velocidex/velociraptor/releases/download/v{{ version }}/velociraptor-v{{ version }}-windows-amd64.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True
    - replace: True

velociraptor-env-vars:
  win_path.exists:
    - name: 'C:\standalone\velociraptor\'
