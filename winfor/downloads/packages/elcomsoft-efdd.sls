# Name: Elcomsoft Forensic Disk Decryptor
# Website: https://www.elcomsoft.com/
# Description: Tool for decrypting disks or extracting encryption keys from memory
# Category: Acquisition and Analysis
# Author: Elcomsoft
# License: EULA (https://www.elcomsoft.com/legal.html)
# Version: 2.21.1036.8165
# Notes:

{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set version = '2.21.1036.8165' %}
{% set hash = '480b643d4165b78f89a6d4a964711a9b7309abbd6f897dc5f9dd63b89f0776a8' %}
{% if salt['file.directory_exists'](downloads + '\\elcomsoft-efdd\\') %}

elcomsoft-temp-download-directory-exists:
  test.nop
{% else %}
create-elcomsoft-temp-download-directory:
  file.directory:
    - name: '{{ downloads }}\elcomsoft-efdd'
    - makedirs: True
{% endif %}

elcomsoft-efdd-download-only:
  cmd.run:
    - name: 'Invoke-WebRequest -Uri "https://www.elcomsoft.com/download/efdd_setup_en.msi" -Method GET -UserAgent "Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:138.0) Gecko/20100101 Firefox/138.0" -UseBasicParsing -OutFile {{ downloads }}\elcomsoft-efdd\elcomsoft-efdd-{{ version }}.msi'
    - shell: powershell
