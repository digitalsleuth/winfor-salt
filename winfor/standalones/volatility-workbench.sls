# Name: Volatility Workbench
# Website: https://www.osforensics.com/tools/volatility-workbench.html
# Description: Windows-based GUI for the Volatility 3 Framework
# Category: Windows Analysis
# Author: OSForensics
# License: Volatility Software License (https://www.volatilityfoundation.org/license/vsl-v1.0)
# Version: 3.0.1009
# Notes:

{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set version = '3.0.1009' %}
{% set hash = 'e66bab3e5c867d3ccba9879dfc2e5576fcca21fd764a8a31fee992edbceacbcc' %}
{% set PROGRAMDATA = salt['environ.get']('PROGRAMDATA') %}

volatility-workbench-download:
  file.managed:
    - name: 'C:\salt\tempdownload\VolatilityWorkbench.zip'
    - source: https://www.osforensics.com/downloads/VolatilityWorkbench.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True

volatility-workbench-extract:
  archive.extracted:
    - name: '{{ inpath }}\volatility-workbench'
    - enforce_toplevel: False
    - source: 'C:\salt\tempdownload\VolatilityWorkbench.zip'
    - overwrite: True
    - require:
      - file: volatility-workbench-download

volatility-workbench-shortcut:
  file.shortcut:
    - name: '{{ PROGRAMDATA }}\Microsoft\Windows\Start Menu\Programs\Volatility Workbench.lnk'
    - target: '{{ inpath }}\volatility-workbench\VolatilityWorkbench.exe'
    - force: True
    - working_dir: '{{ inpath }}\volatility-workbench\'
    - makedirs: True
    - require:
      - file: volatility-workbench-download
      - archive: volatility-workbench-extract
