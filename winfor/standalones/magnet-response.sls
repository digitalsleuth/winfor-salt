# Name: Magnet RESPONSE
# Website: https://magnetforensics.com
# Description: Tool to collect data relevant to incident response investigations
# Category: Acquisition and Analysis
# Author: Magnet Forensics
# License: EULA
# Version: 1.70
# Notes:

{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set hash = 'f0b901e89c237d9699d9dcc6a645c1c351705ae8601c9c975089cbf64c37e351' %}
{% set version = '170' %}

magnet-response-download:
  file.managed:
    - name: 'C:\salt\tempdownload\MagnetRESPONSEv{{ version }}.exe'
    - source: https://storage.googleapis.com/mfi-files/free_tools/MagnetRESPONSE/MagnetRESPONSEv{{ version }}.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True

magnet-response-extract:
  cmd.run:
    - name: 'C:\salt\tempdownload\MagnetRESPONSEv{{ version }}.exe -o{{ inpath }}\magnet\Response\ -y'
    - shell: cmd
    - require:
      - file: magnet-response-download
