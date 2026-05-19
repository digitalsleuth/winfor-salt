# Name: Forensic Email Collector
# Website: https://metaspike.com
# Description: Local and Remote email acquisition tool
# Category: Email
# Author: Arman Gungor - Metaspike
# License:
# Version: 4.4.803.1410
# Notes:

{% set url_hash = "01401b5ba718" %}
{% set version = '4.4.803.1410' %}
{% set hash = '11406e1f2329c6b090b64005e7ab439d1018308ed596ad9d4084f8c1980092bf' %}

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
