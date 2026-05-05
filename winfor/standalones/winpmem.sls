# Name: winpmem
# Website: https://github.com/velocidex/WinPmem
# Description: Memory Acquisition Tool
# Category: Acquisition and Analysis
# Author: Mike Cohen (scudette)
# License: Apache License v2 (https://github.com/Velocidex/WinPmem/blob/master/LICENSE)
# Version: 4.0.rc2
# Notes:

{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set version = '4.0.rc1' %}
{% set files = [('winpmem_mini_x64_rc2.exe', 'a4d516b6fcaf3b5b1d4ee709ce86f8eabf1d8028b3a83101479b7568b933d21b'),
                ('winpmem_mini_x86.exe', 'dc6a82fc6cfda792d3182e07de10adbfba42bf336ef269dbc40732c4b2ae052c'),
                ('go-winpmem_amd64_1.0-rc2_signed.exe', '86691bb4af2c17dd9ec4834c04a99ad51e04f780a07d1b05bc382a5d1892e0c4')] %}

{% for file, hash in files %}
winpmem-download-{{ file }}:
  file.managed:
    - name: '{{ inpath }}\winpmem\{{ file }}'
    - source: https://github.com/Velocidex/WinPmem/releases/download/v{{ version }}/{{ file }}
    - source_hash: sha256={{ hash }}
    - makedirs: True
    - replace: True
{% endfor %}
