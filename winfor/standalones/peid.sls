# Name: PEiD
# Website: https://github.com/wolfram77web/app-peid
# Description: Portable Executable identifier
# Category: Executables
# Author: snaker / Qwerton / Jibz
# License: All Rights Reserved
# Version: 0.95
# Notes: 

{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set PROGRAMDATA = salt['environ.get']('PROGRAMDATA') %}

peid-download:
  file.managed:
    - name: '{{ inpath }}\peid\peid.exe'
    - source: https://github.com/wolfram77web/app-peid/raw/master/PEiD.exe
    - source_hash: sha256=e13171d50f45a79bc09b9e4b9ffa38eb02301aca94a1867a9bf8acccc3759030
    - makedirs: True

peid-icon:
  file.managed:
    - name: '{{ inpath }}\peid\peid.ico'
    - source: salt://winfor/files/peid.ico
    - skip_verify: True
    - require:
      - file: peid-download

peid-userdb-download:
  file.managed:
    - name: '{{ inpath }}\peid\userdb.txt'
    - source: https://github.com/wolfram77web/app-peid/raw/master/userdb.txt
    - source_hash: sha256=4ebc240a724c39351ff4887efa5ecf2e9e3a4b75fea0eceb51d701e386d74380
    - makedirs: True
    - require:
      - file: peid-download

standalones-peid-shortcut:
  file.shortcut:
    - name: '{{ PROGRAMDATA }}\Microsoft\Windows\Start Menu\Programs\PEiD.lnk'
    - target: '{{ inpath }}\peid\peid.exe'
    - force: True
    - icon_location: '{{ inpath }}\peid\peid.ico'
    - working_dir: '{{ inpath }}\peid\'
    - makedirs: True
    - require:
      - file: peid-download
      - file: peid-userdb-download
