# Name: Scylla
# Website: https://github.com/ntquery/scylla
# Description: Imports Reconstructor written in C/C++
# Category: Executables
# Author: NtQuery
# License: GNU General Public License v3 (https://github.com/NtQuery/Scylla/blob/master/LICENSE)
# Version: 0.9.8
# Notes: May not work well on later versions of Windows 10 and any version of Windows 11

{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set PROGRAMDATA = salt['environ.get']('PROGRAMDATA') %}

include:
  - winfor.packages.7zip

scylla-download:
  file.managed:
    - name: 'C:\salt\tempdownload\Scylla_v0.9.8.rar'
    - source: https://github.com/NtQuery/Scylla/releases/download/v0.9.8/Scylla_v0.9.8.rar
    - source_hash: sha256=48a4338d999ec5f33b5964c51893a04fc9e2d104b0c7786f50751f7db5dcbe52
    - makedirs: True

scylla-extract:
  cmd.run:
    - name: '"C:\Program Files\7-Zip\7z.exe" x C:\salt\tempdownload\Scylla_v0.9.8.rar -aoa -o{{ inpath }}\scylla'
    - shell: cmd
    - require:
      - file: scylla-download
      - sls: winfor.packages.7zip

standalones-scylla-shortcut-1:
  file.shortcut:
    - name: '{{ PROGRAMDATA }}\Microsoft\Windows\Start Menu\Programs\Scylla x64.lnk'
    - target: '{{ inpath }}\scylla\Scylla_x64.exe'
    - force: True
    - working_dir: '{{ inpath }}\scylla\'
    - makedirs: True
    - require:
      - file: scylla-download
      - cmd: scylla-extract

standalones-scylla-shortcut-2:
  file.shortcut:
    - name: '{{ PROGRAMDATA }}\Microsoft\Windows\Start Menu\Programs\Scylla x86.lnk'
    - target: '{{ inpath }}\scylla\Scylla_x86.exe'
    - force: True
    - working_dir: '{{ inpath }}\scylla\'
    - makedirs: True
    - require:
      - file: scylla-download
      - cmd: scylla-extract
