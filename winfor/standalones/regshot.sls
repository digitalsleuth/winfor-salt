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
{% set PROGRAMDATA = salt['environ.get']('PROGRAMDATA') %}
{% set hash = '5933d59f591e1e68ce7819904f8cb1118fc935bdfe89581599d0560ec9b97cd6' %}
{% set files = ['Regshot x64 ANSI', 'Regshot x64 Unicode', 'Regshot x86 ANSI', 'Regshot x86 Unicode'] %}

include:
  - winfor.packages.7zip

regshot-download:
  file.managed:
    - name: 'C:\salt\tempdownload\Regshot-{{ version }}.7z'
    - source: https://cytranet-dal.dl.sourceforge.net/project/regshot/regshot/{{ version.split("_")[0] }}/Regshot-{{ version }}.7z
    - source_hash: sha256={{ hash }}
    - makedirs: True

regshot-extract:
  cmd.run:
    - name: '"C:\Program Files\7-Zip\7z.exe" x C:\salt\tempdownload\Regshot-{{ version }}.7z -aoa -o{{ inpath }}\regshot'
    - shell: cmd
    - require:
      - file: regshot-download
      - sls: winfor.packages.7zip

{% for file in files %}
regshot-shortcut-{{ file }}:
  file.shortcut:
    - name: '{{ PROGRAMDATA }}\Microsoft\Windows\Start Menu\Programs\{{ file }}.lnk'
    - target: '{{ inpath }}\regshot\{{ file | replace(" ","-") }}.exe'
    - force: True
    - working_dir: '{{ inpath }}\regshot\'
    - makedirs: True
    - require:
      - cmd: regshot-extract
      - file: regshot-download
{% endfor %}
