{% set PROGRAMDATA = salt['environ.get']('PROGRAMDATA') %}

include:
  - winfor.installers.dotnetfx35

offvis-download:
  file.managed:
    - name: 'C:\salt\tempdownload\OffVis.zip'
    - source: https://go.microsoft.com/fwlink/?LinkId=158791
    - source_hash: sha256=8432c2e81ab51bf46fc9a1b17629f4ff7c3902f976132477428b84918be08351
    - makedirs: True
    - require:
      - sls: winfor.installers.dotnetfx35

offvis-extract:
  archive.extracted:
    - name: 'C:\standalone\OffVis'
    - source: 'C:\salt\tempdownload\OffVis.zip'
    - enforce_toplevel: False
    - require:
      - file: offvis-download

winfor-standalones-offvis-shortcut:
  file.shortcut:
    - name: '{{ PROGRAMDATA }}\Microsoft\Windows\Start Menu\Programs\OffVis.lnk'
    - target: 'C:\standalone\OffVis\OffVis.exe'
    - force: True
    - working_dir: 'C:\standalone\OffVis'
    - makedirs: True
    - require:
      - file: offvis-download
      - archive: offvis-extract
