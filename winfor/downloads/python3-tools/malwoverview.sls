# Name: malwoverview
# Website: https://github.com/alexandreborges/malwoverview
# Description: Malware metadata lookup tool
# Category: Executables
# Author: Alexandre Borges
# License: GNU General Public License v3.0 (https://github.com/alexandreborges/malwoverview/blob/master/LICENSE)
# Version: 8.0.5
# Notes:

include:
  - winfor.downloads.packages.python3
  - winfor.standalones.portable-python3

{% set version = '8.0.5' %}
{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

malwoverview-directory-download-only:
  file.directory:
    - name: '{{ downloads }}\malwoverview'
    - force: True
    - makedirs: True
    - win_inheritance: True

malwoverview-download-only:
  cmd.run:
    - name: '{{ inpath }}\portable-python3\python.exe -m pip download -d packages malwoverview'
    - cwd: '{{ downloads }}\malwoverview'
    - shell: cmd
    - require:
      - sls: winfor.downloads.packages.python3
      - sls: winfor.standalones.portable-python3
