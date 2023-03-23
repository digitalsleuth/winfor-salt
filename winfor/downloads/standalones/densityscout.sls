# Name: densityscout
# Website: https://cert.at
# Description: Tool to identify entropy within files
# Category: Executables
# Author: Christian Wojner / CERT.at (https://cert.at/en/about-us/overview/)
# License: Internet Software Consortium License (ISCL - https://cert.at/en/downloads/software/software-densityscout)
# Version: Build 45
# Notes:

{% set hash = '1EA4C6A32D244DA91E70371054648F25529F69E06548F16C9DA75A9CFC8A2915' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

densityscout-download-only:
  file.managed:
    - name: '{{ downloads }}\densityscout_build_45_windows.zip'
    - source: https://cert.at/media/files/downloads/software/densityscout/files/densityscout_build_45_windows.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True
