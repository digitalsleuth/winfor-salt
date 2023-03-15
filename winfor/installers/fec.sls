# Name: Forensic Email Collector
# Website: https://metaspike.com
# Description: Local and Remote email acquisition tool
# Category: Email
# Author: Arman Gungor - Metaspike
# License: 
# Version: 3.86.0.21
# Notes:

{% set version = '3.86.0.21' %}
{% set hash = '26e1324fbfeefad72a9fbb0f8ad051391053989b6f59a60b7b21ef8150c67253' %}
{% set folder_hash = '85ffc408551a' %}

fec-download:
  file.managed:
    - name: 'C:\salt\tempdownload\FECSetup_v{{ version }}.msi'
    - source: https://storage.googleapis.com/fec-downloads/FEC/{{ version }}_{{ folder_hash }}/FECSetup_v{{ version }}.msi
    - source_hash: sha256={{ hash }}
    - makedirs: True

fec-install:
  cmd.run:
    - name: 'msiexec /i C:\salt\tempdownload\FECSetup_v{{ version }}.msi /qn /norestart'
    - shell: cmd
