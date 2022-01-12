include:
  - winfor.packages.python2

distorm3-download:
  file.managed:
    - name: 'C:\salt\tempdownload\distorm3-3.3.4.win-amd64.exe'
    - source: https://github.com/gdabah/distorm/releases/download/v3.3.4/distorm3-3.3.4.win-amd64.exe
    - source_hash: sha256=0e9774e25f71ffb84d00c2b1b3effbafe6996ce687b316d0c1aa8f0439a6ca71
    - makedirs: True

distorm3-install:
  cmd.run:
    - name: 'C:\Python27\python.exe -m easy_install C:\salt\tempdownload\distorm3-3.3.4.win-amd64.exe'
    - shell: cmd
    - require:
      - sls: winfor.packages.python2
