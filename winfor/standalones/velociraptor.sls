# Name: 
# Website: 
# Description: 
# Category: 
# Author: 
# License: 
# Notes: 

{% set version = 'v0.6.3' %}
{% set hash = '0a2cf80b0696e2dbd012906231b3ca91e1bbc2786c66e141baf775ae44ecd30f' %}

velociraptor-download:
  file.managed:
    - name: 'C:\standalone\velociraptor\velociraptor-{{ version }}-windows-amd64.exe'
    - source: https://github.com/Velocidex/velociraptor/releases/download/{{ version }}/velociraptor-{{ version }}-windows-amd64.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True
    - replace: True

velociraptor-env-vars:
  win_path.exists:
    - name: 'C:\standalone\velociraptor\'
