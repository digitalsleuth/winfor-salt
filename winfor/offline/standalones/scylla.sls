# Name: Scylla
# Website: https://github.com/ntquery/scylla
# Description: Imports Reconstructor written in C/C++
# Category: Executables
# Author: NtQuery
# License: GNU General Public License v3 (https://github.com/NtQuery/Scylla/blob/master/LICENSE)
# Version: 0.9.8
# Notes: May not work well on later versions of Windows 10 and any version of Windows 11

{% set version = '0.9.8' %}
{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set downloads = salt['pillar.get']('offline', 'C:\winfor-downloads') %}
{% set PROGRAMDATA = salt['environ.get']('PROGRAMDATA') %}
{% set pkg = 'scylla-'~ version ~'.rar' %}
{% set exists = salt['file.file_exists'](downloads + '\\scylla\\' + pkg) %}

{% if exists %}

include:
  - winfor.offline.packages.7zip

scylla-extract-offline:
  cmd.run:
    - name: '"C:\Program Files\7-Zip\7z.exe" x "{{ downloads }}\scylla\{{ pkg }}" -aoa -o{{ inpath }}\scylla'
    - shell: cmd
    - require:
      - sls: winfor.offline.packages.7zip

{% for arch in ['x64', 'x86'] %}
scylla-shortcut-{{ arch }}-offline:
  file.shortcut:
    - name: '{{ PROGRAMDATA }}\Microsoft\Windows\Start Menu\Programs\Scylla {{ arch }}.lnk'
    - target: '{{ inpath }}\scylla\Scylla_{{ arch }}.exe'
    - force: True
    - working_dir: '{{ inpath }}\scylla\'
    - makedirs: True
    - require:
      - cmd: scylla-extract-offline
{% endfor %}

{% else %}
{{ pkg }} does not exist - not installing:
  test.nop
{% endif %}
