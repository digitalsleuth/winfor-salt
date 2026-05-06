# Name: Magnet RESPONSE
# Website: https://magnetforensics.com
# Description: Tool to collect data relevant to incident response investigations
# Category: Acquisition and Analysis
# Author: Magnet Forensics
# License: EULA
# Version: 1.72
# Notes:

{% set version = '172' %}
{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set downloads = salt['pillar.get']('offline', 'C:\winfor-downloads') %}

magnet-response-extract:
  cmd.run:
    - name: '{{ downloads }}\magnetforensics\MagnetRESPONSEv{{ version }}.exe -o{{ inpath }}\magnet\Response\ -y'
    - shell: cmd
