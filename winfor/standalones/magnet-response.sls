# Name: Magnet RESPONSE
# Website: https://magnetforensics.com
# Description: Tool to collect data relevant to incident response investigations
# Category: Acquisition and Analysis
# Author: Magnet Forensics
# License: EULA
# Version: 1.71
# Notes:

{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set hash = '426f6878add75b54a78f2a4e029b96d3a759cf4762345d5e3f95591a533319e4' %}
{% set version = '171' %}

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
