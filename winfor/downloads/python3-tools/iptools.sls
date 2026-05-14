# Name: iptools
# Website: https://github.com/digitalsleuth/forensics_tools
# Description: IP / Hex / Dec Conversion tool
# Category: Raw Parsers / Decoders
# Author: Corey Forman
# License: GNU General Public License v3.0 (https://github.com/digitalsleuth/forensics_tools/blob/master/LICENSE)
# Version: 1.1
# Notes:

{% set version = '1.1' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set hash = 'de771ec7c7748fa8a47581e5dc40b3490de62e82482a85dff39f8246ce220b89' %}

iptools-download-only:
  file.managed:
    - name: '{{ downloads }}\iptools\iptools-{{ version }}.py'
    - source: https://github.com/digitalsleuth/forensics_tools/raw/master/iptools.py
    - source_hash: sha256={{ hash }}
    - makedirs: True
