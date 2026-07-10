# Name: regshot
# Website: https://sourceforge.net/projects/regshot/
# Description: Registry snapshot utility to compare snapshots
# Category: Registry
# Author: maddes, regshot, xhmikosr
# License: GNU Lesser General Public License (https://sourceforge.net/p/regshot/code/HEAD/tree/branches/1.9.0/files/license_lgpl-2.1.txt)
# Version: 1.9.1-beta_r321
# Notes: 

{% set version = '1.9.1-beta_r321' %}
{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set downloads = salt['pillar.get']('offline', 'C:\winfor-downloads') %}
{% set PROGRAMDATA = salt['environ.get']('PROGRAMDATA') %}
{% set files = ['Regshot x64 ANSI', 'Regshot x64 Unicode', 'Regshot x86 ANSI', 'Regshot x86 Unicode'] %}
{% set pkg = 'regshot-'~ version ~'.7z' %}
{% set exists = salt['file.file_exists'](downloads + '\\regshot\\' + pkg) %}

{% if exists %}

include:
  - winfor.offline.packages.7zip

regshot-extract-offline:
  cmd.run:
    - name: '"C:\Program Files\7-Zip\7z.exe" x "{{ downloads }}\regshot\{{ pkg }}" -aoa -o{{ inpath }}\regshot'
    - shell: cmd
    - require:
      - sls: winfor.offline.packages.7zip

{% for file in files %}
regshot-shortcut-{{ file }}-offline:
  file.shortcut:
    - name: '{{ PROGRAMDATA }}\Microsoft\Windows\Start Menu\Programs\{{ file }}.lnk'
    - target: '{{ inpath }}\regshot\{{ file | replace(" ","-") }}.exe'
    - force: True
    - working_dir: '{{ inpath }}\regshot\'
    - makedirs: True
    - require:
      - cmd: regshot-extract-offline
{% endfor %}

{% else %}
{{ pkg }} does not exist - not installing:
  test.nop
{% endif %}
