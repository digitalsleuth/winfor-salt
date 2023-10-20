# Name: Pilfer
# Website: https://github.com/digitalsleuth/forensics_tools
# Description: Rapid triage tool using Windows in-built binaries
# Category: Acquisition and Analysis
# Author: Corey Forman (digitalsleuth)
# License: GNU General Public License v3 (https://github.com/digitalsleuth/forensics_tools/blob/master/LICENSE)
# Version: 3.0
# Notes: 

{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set hash = '9a3e86d728c643723ab9ad6ff30bc91d7fdcb805524d1eee2c6dd4d336bba43a' %}

pilfer-download:
  file.managed:
    - name: '{{ inpath }}\pilfer\pilfer.bat'
    - source: https://github.com/digitalsleuth/forensics_tools/raw/master/pilfer.bat
    - source_hash: sha256={{ hash }}
    - makedirs: True
