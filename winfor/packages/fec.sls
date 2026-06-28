# Name: Forensic Email Collector
# Website: https://metaspike.com
# Description: Local and Remote email acquisition tool
# Category: Email
# Author: Arman Gungor - Metaspike
# License:
# Version: 4.5.848.87
# Notes:

{% set url_hash = 'abaf1c75ffb4' %}
{% set version = '4.5.848.87' %}
{% set hash = 'be23e69d8af976cb7ba0eeb6c81b46af0647d0810f47423b526fd9c8fce8b7b8' %}

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
