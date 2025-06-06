# Name: FEX Cloud Capture
# Website: https://getdataforensics.com
# Description: Cloud Acquisition Tool
# Category: Acquisition and Analysis
# Author: GetData Forensics
# License: Free
# Version: 1.20
# Notes: 

{% set version = '1.20' %}
{% set hash = '80ad5221522ba83f04d0a5af29c8b3e60a1d9e6c96932683c334f21b5e35d0ec' %}
{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set PROGRAMDATA = salt['environ.get']('PROGRAMDATA') %}

include:
  - winfor.packages.7zip

fex-cloud-capture-download:
  file.managed:
    - name: 'C:\salt\tempdownload\FEX-Cloud-Capture-64bit-(v{{ version }}).zip'
    - source: https://download.getdata.com/support/fex/cloud/FEX-Cloud-Capture-64bit-(v{{ version }}).zip
    - source_hash: sha256={{ hash }}
    - makedirs: True

fex-cloud-capture-extract:
  cmd.run:
    - name: '"C:\Program Files\7-Zip\7z.exe" x C:\salt\tempdownload\FEX-Cloud-Capture-64bit-(v{{ version }}).zip -aoa -o{{ inpath }}\'
    - shell: cmd
    - require:
      - file: fex-cloud-capture-download
      - sls: winfor.packages.7zip

fex-cloud-capture-rename:
  file.rename:
    - name: '{{ inpath }}\fex-cloud-capture'
    - source: '{{ inpath }}\FEX Cloud Capture'
    - force: True
    - makedirs: True
    - require:
      - cmd: fex-cloud-capture-extract

fex-cloud-capture-shortcut:
  file.shortcut:
    - name: '{{ PROGRAMDATA }}\Microsoft\Windows\Start Menu\Programs\FEX Cloud Capture.lnk'
    - target: '{{ inpath }}\fex-cloud-capture\FEXCloudCapture.exe'
    - force: True
    - working_dir: '{{ inpath }}\fex-cloud-capture\'
    - makedirs: True
    - require:
      - file: fex-cloud-capture-rename
