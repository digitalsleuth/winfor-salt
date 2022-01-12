{% set PROGRAMDATA = salt['environ.get']('PROGRAMDATA') %}

ollydbg201h-download:
  file.managed:
    - name: 'C:\salt\tempdownload\odbg201h.rar'
    - source: 'https://forum.tuts4you.com/files/file/1891-ollydbg/?do=download&r=5780&confirm=1&t=1&csrfKey=08a382b26bbd4d742816204fa7f0200c'
    - source_hash: 
