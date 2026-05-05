# Name: Forensic Email Collector
# Website: https://metaspike.com
# Description: Local and Remote email acquisition tool
# Category: Email
# Author: Arman Gungor - Metaspike
# License:
# Version: 4.4.787.1266
# Notes:

{% set url_hash = "66c4cba67301" %}
{% set version = "4.4.787.1266" %}
{% set hash = "DC017B2A0D2E14169783185628EA6D941EAE5C50C1FECEEF466EC28B0DE2A2E9" %}

forensic-email-collector:
  file.managed:
    - name: 'C:\salt\tempdownload\FECSetup_v{{ version }}.msi'
    - source: https://www.metaspike.com/download/{{ url_hash }}_fec/
    - source_hash: sha256={{ hash }}
    - makedirs: True

forensic-email-collector-install:
  cmd.run:
    - name: "msiexec.exe /i FECSetup_v{{ version }}.msi /qn ACCEPTEULA=1 /norestart"
    - cwd: 'C:\salt\tempdownload'
    - require:
      - file: forensic-email-collector
