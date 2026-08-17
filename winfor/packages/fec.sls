# Name: Forensic Email Collector
# Website: https://metaspike.com
# Description: Local and Remote email acquisition tool
# Category: Email
# Author: Arman Gungor - Metaspike
# License:
# Version: 4.5.888.111
# Notes:

{% set url_hash = '5159dbada900' %}
{% set version = '4.5.888.111' %}
{% set hash = '60db29feb6bb6023b81dec2d45ea067af3f09c80cc951b845581482213b357d6' %}

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
