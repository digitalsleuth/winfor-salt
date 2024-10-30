# Name: X-Ways Forensics
# Website: https://x-ways.net
# Description: Forensic Analysis Software
# Category: Acquisition and Analysis
# Author: Stefan Fleischmann
# License: License Dependent - https://www.x-ways.net/terminology.html
# Version: 21.3
# Notes:

{% set version = "213" %}
{% set auth_token = "TOKENPLACEHOLDER" %}
{% set xwhash = "13a444d9f92853a4f17b0126c5a482557c1bc261fb46961ddbf2b5d533c9f8fb" %}
{% set xviewerhash = "00d573f24f55521869ecd896a47b1e3838e4ad24c701178b565663d79882222f" %}
{% set xviewer_ver = "857" %}
{% set mplayerhash = "9032481e21819bc02c01b11ab11ab82c022e3566eea42bf420c67def85f86fae" %}
{% set tesseracthash = "d071607267792631168d534bd89cd6905ee5d79b392542f81ab945a6e7ce72bd" %}
{% set manualhash = "ac470910b3f7c614e5f6bc91ac62bc9a9fa7657615da3721f835c5d9228735c2" %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

{%- if salt['file.directory_exists'](downloads + "\\x-ways") %}
temp-directory-exists-download-only:
  test.nop
{% else %}
create-directory-download-only:
  file.directory:
    - name: '{{ downloads }}\x-ways\'
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
    - name: 'Invoke-WebRequest -Uri "http://www.x-ways.net/xwf/xw_forensics{{ version }}.zip" -Method GET -Headers @{ Authorization = "Basic {{ auth_token }}" } -UserAgent "IPWorks HTTPComponent - www.nsoftware.com" -UseBasicParsing -OutFile {{ downloads }}\x-ways\xw_forensics{{ version }}.zip'
    - shell: powershell
{% endif %}

{% if salt['file.file_exists'](downloads + 'xw_viewer_' + xviewer_ver + '.zip') and salt['file.check_hash'](downloads + 'xw_viewer_' + xviewer_ver + '.zip', xviewerhash)%}
xways-viewer-already-downloaded-and-hash-verified-download-only:
  test.nop
{% else %}
xways-viewer-download-only:
  cmd.run:
    - name: 'Invoke-WebRequest -Uri "http://www.x-ways.net/res/viewer/xw_viewer_{{ xviewer_ver }}.zip" -Method GET -Headers @{ Authorization = "Basic {{ auth_token }}" } -UserAgent "IPWorks HTTPComponent - www.nsoftware.com" -UseBasicParsing -OutFile {{ downloads }}\x-ways\xw_viewer_{{ xviewer_ver }}.zip'
    - shell: powershell
{% endif %}

{% if salt['file.file_exists'](downloads + 'Tesseract.zip') and salt['file.check_hash'](downloads + 'Tesseract.zip', tesseracthash)%}
xways-tesseract-already-downloaded-and-hash-verified-download-only:
  test.nop
{% else %}
xways-tesseract-download-only:
  cmd.run:
    - name: 'Invoke-WebRequest -Uri "http://www.x-ways.net/res/Tesseract.zip" -Method GET -Headers @{ Authorization = "Basic {{ auth_token }}" } -UserAgent "IPWorks HTTPComponent - www.nsoftware.com" -UseBasicParsing -OutFile {{ downloads }}\x-ways\Tesseract.zip'
    - shell: powershell
{% endif %}

{% if salt['file.file_exists'](downloads + 'MPlayer_2022_x64.zip') and salt['file.check_hash'](downloads + 'MPlayer_2022_x64.zip', mplayerhash)%}
xways-mplayer-already-downloaded-and-hash-verified-download-only:
  test.nop
{% else %}
xways-mplayer-download-only:
  cmd.run:
    - name: 'Invoke-WebRequest -Uri "http://www.x-ways.net/res/mplayer/MPlayer 2022 x64.zip" -Method GET -Headers @{ Authorization = "Basic {{ auth_token }}" } -UserAgent "IPWorks HTTPComponent - www.nsoftware.com" -UseBasicParsing -OutFile {{ downloads }}\x-ways\MPlayer_2022_x64.zip'
    - shell: powershell
{% endif %}

{% if salt['file.file_exists'](downloads + 'xways_manual.pdf') and salt['file.check_hash'](downloads + 'xways_manual.pdf', manualhash)%}
xways-manual-already-downloaded-and-hash-verified-download-only:
  test.nop
{% else %}
xways-manual-download-only:
  cmd.run:
    - name: 'Invoke-WebRequest -Uri "http://www.x-ways.net/winhex/manual.pdf" -Method GET -Headers @{ Authorization = "Basic {{ auth_token }}" } -UserAgent "IPWorks HTTPComponent - www.nsoftware.com" -UseBasicParsing -OutFile {{ downloads }}\x-ways\xways_manual.pdf'
    - shell: powershell
{% endif %}
{% endif %}
