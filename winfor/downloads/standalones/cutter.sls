# Name: Cutter
# Website: https://github.com/rizinorg/cutter
# Description: Reverse Engineering Platform powered by rizin
# Category: Executables
# Author: Rizin Organization
# License: GNU General Public License v3 (https://github.com/rizinorg/cutter/blob/dev/COPYING)
# Version: 2.5.0
# Notes: 

{% set version = '2.5.0' %}
{% set hash = 'a04154a03a392dbf5886a629938582f7d23a93636fa0611c3e1c34905b197e69' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

cutter-download-only:
  file.managed:
    - name: '{{ downloads }}\cutter\cutter-{{ version }}.zip'
    - source: https://github.com/rizinorg/cutter/releases/download/v{{ version }}/Cutter-v{{ version }}-Windows-x86_64.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True
