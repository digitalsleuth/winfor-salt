# Name: FEX Cloud Capture
# Website: https://getdataforensics.com
# Description: Cloud Acquisition Tool
# Category: Acquisition and Analysis
# Author: GetData Forensics
# License: Free
# Version: 1.30
# Notes: 

{% set version = '1.30' %}
{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set downloads = salt['pillar.get']('offline', 'C:\winfor-downloads') %}
{% set PROGRAMDATA = salt['environ.get']('PROGRAMDATA') %}

include:
  - winfor.offline.packages.7zip

fex-cloud-capture-extract-offline:
  cmd.run:
    - name: '"C:\Program Files\7-Zip\7z.exe" x {{ downloads }}\fex-cloud-capture\FEX-Cloud-Capture-64bit-(v{{ version }}).zip -aoa -o{{ inpath }}\'
    - shell: cmd
    - require:
      - sls: winfor.offline.packages.7zip

fex-cloud-capture-rename-offline:
  file.rename:
    - name: '{{ inpath }}\fex-cloud-capture'
    - source: '{{ inpath }}\FEXCloudCapture-v{{ version | replace(".","") }}'
    - force: True
    - makedirs: True
    - require:
      - cmd: fex-cloud-capture-extract-offline

fex-cloud-capture-shortcut-offline:
  file.shortcut:
    - name: '{{ PROGRAMDATA }}\Microsoft\Windows\Start Menu\Programs\FEX Cloud Capture.lnk'
    - target: '{{ inpath }}\fex-cloud-capture\FEXCloud.exe'
    - force: True
    - working_dir: '{{ inpath }}\fex-cloud-capture\'
    - makedirs: True
    - require:
      - file: fex-cloud-capture-rename-offline
