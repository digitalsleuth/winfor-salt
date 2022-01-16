{% set PROGRAMDATA = salt['environ.get']('PROGRAMDATA') %}

peid-download:
  file.managed:
    - name: 'C:\standalone\peid\peid.exe'
    - source: https://github.com/wolfram77web/app-peid/raw/master/PEiD.exe
    - source_hash: sha256=e13171d50f45a79bc09b9e4b9ffa38eb02301aca94a1867a9bf8acccc3759030
    - makedirs: True

peid-userdb-download:
  file.managed:
    - name: 'C:\standalone\peid\userdb.txt'
    - source: https://github.com/wolfram77web/app-peid/raw/master/userdb.txt
    - source_hash: sha256=4ebc240a724c39351ff4887efa5ecf2e9e3a4b75fea0eceb51d701e386d74380
    - makedirs: True
    - require:
      - file: peid-download

winfor-standalones-peid-shortcut:
  file.shortcut:
    - name: '{{ PROGRAMDATA }}\Microsoft\Windows\Start Menu\Programs\PEiD.lnk'
    - target: 'C:\standalone\peid\peid.exe'
    - force: True
    - working_dir: 'C:\standalone\peid\'
    - makedirs: True
    - require:
      - file: peid-download
      - file: peid-userdb-download
