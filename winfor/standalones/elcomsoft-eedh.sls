# Name: Elcomsoft Encrypted Disk Hunter
# Website: https://blog.elcomsoft.com/2020/07/live-system-analysis-discovering-encrypted-disk-volumes/
# Description: Tool to identify encrypted disks on Windows computers
# Category: Utilities
# Author: Elcomsoft
# License: Proprietary License (https://www.elcomsoft.com/help/Elcomsoft_EULA_free_en.pdf)
# Version: 1.10
# Notes: 

{% set inpath = salt["pillar.get"]("inpath", "C:\standalone") %}
{% set version = '1.10' %}
{% set hash =  'c0187e4cef3598a649d29195b88e8f9df72b79974d667aebadd2c9e806a033df' %}
{% set PROGRAMDATA = salt["environ.get"]("PROGRAMDATA") %}

create-temp-directory-for-eedh:
  file.directory:
    - name: 'C:\salt\tempdownload'
    - makedirs: True

elcomsoft-eedh-download:
  cmd.run:
    - name: 'Invoke-WebRequest -Uri "https://download_us.elcomsoft.com/eedh.zip" -Method GET -UserAgent "Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:138.0) Gecko/20100101 Firefox/138.0" -UseBasicParsing -OutFile C:\salt\tempdownload\eedh.zip'
    - shell: powershell
    - require:
      - file: create-temp-directory-for-eedh

elcomsoft-eedh-extract:
  archive.extracted:
    - name: '{{ inpath }}\eedh'
    - source: 'C:\salt\tempdownload\eedh.zip'
    - enforce_toplevel: False
    - onchanges:
      - cmd: elcomsoft-eedh-download    
    - onlyif:
      - fun: file.check_hash
        path: 'C:\salt\tempdownload\eedh.zip'
        file_hash: {{ hash }}
