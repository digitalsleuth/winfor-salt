# Name: Codetrack
# Website: https://www.getcodetrack.com
# Description: .NET Performance Profiler
# Category: Executables
# Author: Nico Van Goethem
# License: Freeware (see the About section in the application)
# Version: 1.0.3.3
# Notes: No longer maintained

{% set version = '1.0.3.3' %}
{% set hash = '455eccfcc568004bf6108ba9ad8dbbc32cdecb84c6c62153c8f181ca984d68ce' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

codetrack-download-only:
  file.managed:
    - name: '{{ downloads }}\codetrack_1_0_3_3.zip'
    - source: https://www.getcodetrack.com/releases/codetrack_1_0_3_3.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True
