# Name: Forensic Email Collector
# Website: https://metaspike.com
# Description: Local and Remote email acquisition tool
# Category: Email
# Author: Arman Gungor - Metaspike
# License:
# Version: 4.4.725.1147
# Notes:

{% set url_hash = "ec8806b8d127" %}
{% set version = "4.4.725.1147" %}
{% set hash = "9BF116FADDF13E1C6E2F1AA0ECACAB32F6251053CB2FE733016FC210201BF35B" %}

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
