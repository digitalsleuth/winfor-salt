# Name: Elcomsoft Forensic Disk Decryptor
# Website: https://www.elcomsoft.com/
# Description: Tool for decrypting disks or extracting encryption keys from memory
# Category: Acquisition and Analysis
# Author: Elcomsoft
# License: EULA (https://www.elcomsoft.com/legal.html)
# Version: 2.20.1011.6893
# Notes:

{% set version = '2.20.1011.6893' %}
{% set hash = '675ca40709c5b8b64ef19ac43db306d919203423fe1e63033226c0706bc05c7b' %}

elcomsoft-efdd-download:
  file.managed:
    - name: 'C:\salt\tempdownload\elcomsoft-efdd\efdd_setup_en-{{ version }}.msi'
    - source: https://www.elcomsoft.com/download/efdd_setup_en.msi
    - source_hash: sha256={{ hash }}
    - verify_ssl: False
    - makedirs: True

elcomsoft-efdd-install:
  cmd.run:
    - name: 'msiexec /i efdd_setup_en-{{ version }}.msi /quiet /norestart'
    - cwd: 'C:\salt\tempdownload\elcomsoft-efdd\'
    - require:
      - file: elcomsoft-efdd-download
