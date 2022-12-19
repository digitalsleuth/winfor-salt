# Name: regshot
# Website: https://sourceforge.net/projects/regshot/
# Description: Registry snapshot utility to compare snapshots
# Category: Registry
# Author: maddes, regshot, xhmikosr
# License: GNU Lesser General Public License (https://sourceforge.net/p/regshot/code/HEAD/tree/branches/1.9.0/files/license_lgpl-2.1.txt)
# Version: 1.9.0
# Notes: 

{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set PROGRAMDATA = salt['environ.get']('PROGRAMDATA') %}

include:
  - winfor.packages.7zip

regshot-download:
  file.managed:
    - name: 'C:\salt\tempdownload\Regshot-1.9.0.7z'
    - source: https://versaweb.dl.sourceforge.net/project/regshot/regshot/1.9.0/Regshot-1.9.0.7z
    - source_hash: sha256=a92327ffa25f456dff86bae60d42dc8e85e8f3cf987d1d0449d0402a39827d85
    - makedirs: True

regshot-extract:
  cmd.run:
    - name: '"C:\Program Files\7-Zip\7z.exe" x C:\salt\tempdownload\Regshot-1.9.0.7z -aoa -o{{ inpath }}\regshot'
    - shell: cmd
    - require:
      - file: regshot-download
      - sls: winfor.packages.7zip

winfor-standalones-regshot-shortcut-1:
  file.shortcut:
    - name: '{{ PROGRAMDATA }}\Microsoft\Windows\Start Menu\Programs\Regshot x64 ANSI.lnk'
    - target: '{{ inpath }}\regshot\Regshot-x64-ANSI.exe'
    - force: True
    - working_dir: '{{ inpath }}\regshot\'
    - makedirs: True
    - require:
      - file: regshot-download
      - cmd: regshot-extract

winfor-standalones-regshot-shortcut-2:
  file.shortcut:
    - name: '{{ PROGRAMDATA }}\Microsoft\Windows\Start Menu\Programs\Regshot x64 Unicode.lnk'
    - target: '{{ inpath }}\regshot\Regshot-x64-Unicode.exe'
    - force: True
    - working_dir: '{{ inpath }}\regshot\'
    - makedirs: True
    - require:
      - file: regshot-download      
      - cmd: regshot-extract            

winfor-standalones-regshot-shortcut-3:
  file.shortcut:
    - name: '{{ PROGRAMDATA }}\Microsoft\Windows\Start Menu\Programs\Regshot x86 ANSI.lnk'
    - target: '{{ inpath }}\regshot\Regshot-x86-ANSI.exe'
    - force: True
    - working_dir: '{{ inpath }}\regshot\'
    - makedirs: True
    - require:
      - file: regshot-download
      - cmd: regshot-extract

winfor-standalones-regshot-shortcut-4:
  file.shortcut:
    - name: '{{ PROGRAMDATA }}\Microsoft\Windows\Start Menu\Programs\Regshot x86 Unicode.lnk'
    - target: '{{ inpath }}\regshot\Regshot-x86-Unicode.exe'
    - force: True
    - working_dir: '{{ inpath }}\regshot\'
    - makedirs: True
    - require:
      - file: regshot-download
      - cmd: regshot-extract
