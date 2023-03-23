# Name: X-Ways Forensics
# Website: https://x-ways.net
# Description: Forensic Analysis Software
# Category: Acquisition and Analysis
# Author: Stefan Fleischmann
# License: License Dependent - https://www.x-ways.net/terminology.html
# Version: 20.7 SR-2 x64
# Notes:

{% set version = "207" %}
{% set auth_token = "TOKENPLACEHOLDER" %}
{% set xwhash = "83ef47673964e53cb54a83878a79e92c0e73518b09196583204627037168895b" %}
{% set xviewerhash = "544b69c75823d351abb35a2eaa7d7ba40760e012db22cdf45c0f82b6392a1f3b" %}
{% set mplayerhash = "a3a13bbda7ba0052c71521124e428f490648ea452f3bcbcf31860b9d0120ed25" %}
{% set tesseracthash = "95c484205c6474b7b7ef5109a3412666090857c44999cf72f06f55dc9c239310" %}
{% set manualhash = "b4e990c8181a962891aa742b522c8cedabe41f8c7dbbeed4e9d3d6575e940d0a" %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

{% if salt['file.directory_exists'](downloads) %}
temp-directory-exists-download-only:
  test.nop
{% else %}
create-directory-download-only:
  file.directory:
    - name: '{{ downloads }}'
    - makedirs: True
{% endif %}

{% if auth_token == "TOKENPLACEHOLDER" %}

xways-credentials-not-provided-download-only:
  test.nop

{% else %}

{% if salt['file.file_exists'](downloads + 'xw_forensics' + version + '.zip') and salt['file.check_hash'](downloads + 'xw_forensics' + version + '.zip', xwhash)%}
xways-already-downloaded-and-hash-verified-download-only:
  test.nop
{% else %}
xways-download-only:
  cmd.run:
    - name: 'Invoke-WebRequest -Uri "http://www.x-ways.net/xwf/xw_forensics{{ version }}.zip" -Method GET -Headers @{ Authorization = "Basic {{ auth_token }}" } -UserAgent "IPWorks HTTPComponent - www.nsoftware.com" -UseBasicParsing -OutFile {{ downloads }}\xw_forensics{{ version }}.zip'
    - shell: powershell
{% endif %}

{% if salt['file.file_exists'](downloads + 'xw_viewer.zip') and salt['file.check_hash'](downloads + 'xw_viewer.zip', xviewerhash)%}
xways-viewer-already-downloaded-and-hash-verified-download-only:
  test.nop
{% else %}
xways-viewer-download-only:
  cmd.run:
    - name: 'Invoke-WebRequest -Uri "http://www.x-ways.net/res/viewer/xw_viewer.zip" -Method GET -Headers @{ Authorization = "Basic {{ auth_token }}" } -UserAgent "IPWorks HTTPComponent - www.nsoftware.com" -UseBasicParsing -OutFile {{ downloads }}\xw_viewer.zip'
    - shell: powershell
{% endif %}

{% if salt['file.file_exists'](downloads + 'Tesseract.zip') and salt['file.check_hash'](downloads + 'Tesseract.zip', tesseracthash)%}
xways-tesseract-already-downloaded-and-hash-verified-download-only:
  test.nop
{% else %}
xways-tesseract-download-only:
  cmd.run:
    - name: 'Invoke-WebRequest -Uri "http://www.x-ways.net/res/Tesseract.zip" -Method GET -Headers @{ Authorization = "Basic {{ auth_token }}" } -UserAgent "IPWorks HTTPComponent - www.nsoftware.com" -UseBasicParsing -OutFile {{ downloads }}\Tesseract.zip'
    - shell: powershell
{% endif %}

{% if salt['file.file_exists'](downloads + 'MPlayer_2018_x64.zip') and salt['file.check_hash'](downloads + 'MPlayer_2018_x64.zip', mplayerhash)%}
xways-mplayer-already-downloaded-and-hash-verified-download-only:
  test.nop
{% else %}
xways-mplayer-download-only:
  cmd.run:
    - name: 'Invoke-WebRequest -Uri "http://www.x-ways.net/res/mplayer/MPlayer 2018 x64.zip" -Method GET -Headers @{ Authorization = "Basic {{ auth_token }}" } -UserAgent "IPWorks HTTPComponent - www.nsoftware.com" -UseBasicParsing -OutFile {{ downloads }}\MPlayer_2018_x64.zip'
    - shell: powershell
{% endif %}

{% if salt['file.file_exists'](downloads + 'xways_manual.pdf') and salt['file.check_hash'](downloads + 'xways_manual.pdf', manualhash)%}
xways-manual-already-downloaded-and-hash-verified-download-only:
  test.nop
{% else %}
xways-manual-download-only:
  cmd.run:
    - name: 'Invoke-WebRequest -Uri "http://www.x-ways.net/winhex/manual.pdf" -Method GET -Headers @{ Authorization = "Basic {{ auth_token }}" } -UserAgent "IPWorks HTTPComponent - www.nsoftware.com" -UseBasicParsing -OutFile {{ downloads }}\xways_manual.pdf'
    - shell: powershell
{% endif %}
{% endif %}
