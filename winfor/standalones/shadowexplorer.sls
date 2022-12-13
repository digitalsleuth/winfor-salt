# Name: Shadow Explorer
# Website: https://www.shadowexplorer.com
# Description: Windows Volume Shadow Copy viewer
# Category: Windows Analysis
# Author: ShadowExplorer
# License: 
# Version: 0.9.462.0
# Notes: 

{% set PROGRAMDATA = salt['environ.get']('PROGRAMDATA') %}

shadow-explorer-download:
  file.managed:
    - name: 'C:\salt\tempdownload\ShadowExplorer-0.9-portable.zip'
    - source: https://www.shadowexplorer.com/uploads/ShadowExplorer-0.9-portable.zip
    - source_hash: sha256=92590121920b130a7787c25036d17cf4bd188f1de7cfac6d98c254eef531bb92
    - makedirs: True

shadow-explorer-extract:
  archive.extracted:
    - name: 'C:\standalone\shadowexplorer\'
    - source: 'C:\salt\tempdownload\ShadowExplorer-0.9-portable.zip'
    - enforce_toplevel: False
    - require:
      - file: shadow-explorer-download

shadow-explorer-folder-rename:
  file.rename:
    - name: 'C:\standalone\shadowexplorer'
    - source: 'C:\standalone\ShadowExplorerPortable-0.9'
    - force: True
    - makedirs: True
    - require:
      - archive: shadow-explorer-extract

winfor-shadow-explorer-shortcut:
  file.shortcut:
    - name: '{{ PROGRAMDATA }}\Microsoft\Windows\Start Menu\Programs\ShadowExplorer.lnk'
    - target: 'C:\standalone\shadowexplorer\ShadowExplorerPortable.exe'
    - force: True
    - working_dir: 'C:\standalone\shadowexplorer\'
    - makedirs: True
    - require:
      - file: shadow-explorer-folder-rename
