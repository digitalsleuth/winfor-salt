# Name: Volatility3
# Website: https://github.com/volatilityfoundation/volatility3
# Description: Memory analysis toolset
# Category: Windows Analysis
# Author: Volatility Foundation
# License: Volatility Software License (https://www.volatilityfoundation.org/license/vsl-v1.0)
# Version: 2.27.0
# Notes: Downgraded from 2.28.x until Win 11 memory parsing issues are resolved

{% set version = "2.27.0" %}
{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

include:
  - winfor.standalones.portable-python3
  - winfor.downloads.packages.python3
  - winfor.downloads.python3-tools.py3-pycryptodome
  - winfor.downloads.python3-tools.yara-python

volatility3-folder-download-only:
  file.directory:
    - name: '{{ downloads }}\volatility3'
    - makedirs: True
    - force: True
    - win_inheritance: True

volatility3-download-only:
  cmd.run:
    - name: '{{ inpath }}\portable-python3\python.exe -m pip download -d packages volatility3=={{ version }}'
    - cwd: '{{ downloads }}\volatility3\'
    - require:
      - sls: winfor.standalones.portable-python3
      - file: volatility3-folder-download-only
      - sls: winfor.downloads.packages.python3
      - sls: winfor.downloads.python3-tools.py3-pycryptodome
      - sls: winfor.downloads.python3-tools.yara-python

volatility3-windows-symbols-download-only:
  file.managed:
    - name: '{{ downloads }}\volatility3\windows.zip'
    - source: https://downloads.volatilityfoundation.org/volatility3/symbols/windows.zip
    - source_hash: sha256=231d69735b9a5482b16bdbf1ec356e0a95574c44079e68dfb02ebddb34d55f3e
    - makedirs: True
    - require:
      - cmd: volatility3-download-only

volatility3-linux-symbols-download-only:
  file.managed:
    - name: '{{ downloads }}\volatility3\linux.zip'
    - source: https://downloads.volatilityfoundation.org/volatility3/symbols/linux.zip
    - source_hash: sha256=58bb7da2ed1e491ce922d04a59881d201e233b5605c9fd5a7f0c08ee528253c6
    - makedirs: True
    - require:
      - cmd: volatility3-download-only

volatility3-mac-symbols-download-only:
  file.managed:
    - name: '{{ downloads }}\volatility3\mac.zip'
    - source: https://downloads.volatilityfoundation.org/volatility3/symbols/mac.zip
    - source_hash: sha256=fd12c8338724b175b0c5765af3313328b700ad53de4a00b4aa50e9a8bcef9129
    - makedirs: True
    - require:
      - cmd: volatility3-download-only
