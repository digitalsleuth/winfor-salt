# Name: Magnet RESPONSE
# Website: https://magnetforensics.com
# Description: Tool to collect data relevant to incident response investigations
# Category: Acquisition and Analysis
# Author: Magnet Forensics
# License: EULA
# Version: 1.72
# Notes:

{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set hash = 'd315c63d1ad4b89e03c7688b29169e977c2abc4559c23b9f6b2282f3c91a6c7d' %}
{% set version = '172' %}

magnet-response-download:
  file.managed:
    - name: 'C:\salt\tempdownload\MagnetRESPONSEv{{ version }}.exe'
    - source: https://storage.googleapis.com/mfi-files/free_tools/MagnetRESPONSE/MagnetRESPONSEv{{ version }}_Self_Extracting_Archive.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True

magnet-response-extract:
  cmd.run:
    - name: 'C:\salt\tempdownload\MagnetRESPONSEv{{ version }}.exe -o{{ inpath }}\magnet\Response\ -y'
    - shell: cmd
    - require:
      - file: magnet-response-download
