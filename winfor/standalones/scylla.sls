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
    - name: '"C:\Program Files\7-Zip\7z.exe" x C:\salt\tempdownload\Scylla_v0.9.8.rar -oC:\standalone\scylla'
    - shell: cmd
    - require:
      - file: scylla-download
      - sls: winfor.packages.7zip

winfor-standalones-scylla-shortcut-1:
  file.shortcut:
    - name: '{{ PROGRAMDATA }}\Microsoft\Windows\Start Menu\Programs\Scylla x64.lnk'
    - target: 'C:\standalone\scylla\Scylla_x64.exe'
    - force: True
    - working_dir: 'C:\standalone\scylla\'
    - makedirs: True
    - require:
      - file: scylla-download
      - cmd: scylla-extract

winfor-standalones-scylla-shortcut-2:
  file.shortcut:
    - name: '{{ PROGRAMDATA }}\Microsoft\Windows\Start Menu\Programs\Scylla x86.lnk'
    - target: 'C:\standalone\scylla\Scylla_x86.exe'
    - force: True
    - working_dir: 'C:\standalone\scylla\'
    - makedirs: True
    - require:
      - file: scylla-download
      - cmd: scylla-extract
