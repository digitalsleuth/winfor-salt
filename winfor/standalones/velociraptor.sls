# Name: 
# Website: 
# Description: 
# Category: 
# Author: 
# License: 
# Notes: 

{% set version = 'v0.6.6-2' %}
{% set hash = '77A9A479DD5E7E42D8ADC7550936FFB58035B8E28E84ADAA5B0B7347BACC1EB1' %}

velociraptor-download:
  file.managed:
    - name: 'C:\standalone\velociraptor\velociraptor-{{ version }}-windows-amd64.exe'
    - source: https://github.com/Velocidex/velociraptor/releases/download/v0.6.6-1/velociraptor-{{ version }}-windows-amd64.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True
    - replace: True

velociraptor-env-vars:
  win_path.exists:
    - name: 'C:\standalone\velociraptor\'
