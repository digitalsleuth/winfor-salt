# Name: Elcomsoft Forensic Disk Decryptor
# Website: https://www.elcomsoft.com/
# Description: Tool for decrypting disks or extracting encryption keys from memory
# Category: Acquisition and Analysis
# Author: Elcomsoft
# License: EULA (https://www.elcomsoft.com/legal.html)
# Version: 2.21.1024.8145
# Notes:

{% set version = '2.21.1024.8145' %}
{% set hash = 'f6dcaa7c94be5346524d532003a535305eb70eea5ca16cc4e98333dc292a4e3c' %}

{% if salt['file.directory_exists']('C:\\salt\\tempdownload\\elcomsoft-efdd\\') %}
elcomsoft-temp-directory-exists:
  test.nop
{% else %}
create-elcomsoft-temp-directory:
  file.directory:
    - name: 'C:\salt\tempdownload\elcomsoft-efdd'
    - makedirs: True
{% endif %}

{% if salt['file.file_exists']('C:\\salt\\tempdownload\\elcomsoft-efdd\\efdd_setup_en-' + version + '.msi') and salt['file.check_hash']('C:\\salt\\tempdownload\\elcomsoft-efdd\\efdd_setup_en-' + version + '.msi', hash)%}
elcomsoft-efdd-already-downloaded-and-hash-verified:
  test.nop
 
elcomsoft-efdd-already-downloaded-install:
  cmd.run:
    - name: 'msiexec /i efdd_setup_en-{{ version }}.msi /quiet /norestart'
    - cwd: 'C:\salt\tempdownload\elcomsoft-efdd\'
    - require:
      - test: elcomsoft-efdd-already-downloaded-and-hash-verified

{% else %}

elcomsoft-efdd-download:
  cmd.run:
    - name: 'Invoke-WebRequest -Uri "https://www.elcomsoft.com/download/efdd_setup_en.msi" -Method GET -UserAgent "Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:138.0) Gecko/20100101 Firefox/138.0" -UseBasicParsing -OutFile C:\salt\tempdownload\elcomsoft-efdd\efdd_setup_en-{{ version }}.msi'
    - shell: powershell

elcomsoft-efdd-install:
  cmd.run:
    - name: 'msiexec /i efdd_setup_en-{{ version }}.msi /quiet /norestart'
    - cwd: 'C:\salt\tempdownload\elcomsoft-efdd\'
    - require:
      - cmd: elcomsoft-efdd-download

{% endif %}
