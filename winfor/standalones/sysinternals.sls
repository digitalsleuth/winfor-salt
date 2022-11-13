# Name: 
# Website: 
# Description: 
# Category: 
# Author: 
# License: 
# Notes: 

{% set hash = '76e374b9844fa1e6491cc3e70d73f9ce885253258b86d277d84e40452ba8b8f5' %}
{% set PROGRAMDATA = salt['environ.get']('PROGRAMDATA') %}

sysinternals:
  file.managed:
    - name: 'C:\salt\tempdownload\SysinternalsSuite.zip'
    - source: https://download.sysinternals.com/files/SysinternalsSuite.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True

sysinternals-extract:
  archive.extracted:
    - name: 'C:\standalone\sysinternals\'
    - source: 'C:\salt\tempdownload\SysinternalsSuite.zip'
    - enforce_toplevel: false
    - require:
      - file: sysinternals

sysinternals-env-vars:
  win_path.exists:
    - name: 'C:\standalone\sysinternals'

winfor-standalones-sysinternals-shortcut:
  file.shortcut:
    - name: '{{ PROGRAMDATA }}\Microsoft\Windows\Start Menu\Programs\Sysinternals.lnk'
    - target: 'C:\standalone\sysinternals\'
    - force: True
    - working_dir: 'C:\standalone\sysinternals\'
    - makedirs: True
    - require:
      - file: sysinternals
      - archive: sysinternals-extract
