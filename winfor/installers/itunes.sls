# Name: Apple iTunes
# Website: https://www.apple.com
# Description: Media viewer and Apple device manager
# Category: Utilities
# Author: Apple
# License: EULA
# Version: 12.13.7.1
# Notes:

{% set version = '12.13.7.1' %}
{% from 'winfor/_macros/hashes.jinja' import get_hash %}
{% set hash = get_hash('itunes') %}
{% set guid = get_hash('itunes', 'guid') %}

itunes-download:
  file.managed:
    - name: 'C:\salt\tempdownload\iTunes64Setup.exe'
    - source: https://secure-appldnld.apple.com/itunes12/{{ guid }}/iTunes64Setup.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True
    - force: True

itunes-install:
  cmd.run:
    - name: 'C:\salt\tempdownload\iTunes64Setup.exe /quiet /qn ALLUSERS=1 /norestart'
    - shell: cmd
    - success_retcodes: 3010
    - require:
      - file: itunes-download

itunes-icon:
  file.absent:
    - name: 'C:\Users\Public\Desktop\iTunes.lnk'
    - require:
      - cmd: itunes-install
