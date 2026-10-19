# Name: X-Ways Forensics
# Website: https://x-ways.net
# Description: Forensic Analysis Software
# Category: Acquisition and Analysis
# Author: Stefan Fleischmann
# License: License Dependent - https://www.x-ways.net/terminology.html
# Version: 21.3
# Notes:

{% set version = '21.3' %}
{% set nodot = version.replace(".","") %}
{% set auth_token = 'TOKENPLACEHOLDER' %}
{% from 'winfor/_macros/hashes.jinja' import get_hash %}
{% set xwhash = get_hash('x-ways', 'xwhash') %}
{% set xviewerhash = get_hash('x-ways', 'xviewerhash') %}
{% set xviewer_ver = get_hash('x-ways', 'xviewer_ver') %}
{% set mplayerhash = get_hash('x-ways', 'mplayerhash') %}
{% set tesseracthash = get_hash('x-ways', 'tesseracthash') %}
{% set manualhash = get_hash('x-ways', 'manualhash') %}
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

{% if salt['file.file_exists'](downloads + 'xways-' + version + '.zip') and salt['file.check_hash'](downloads + 'xways-' + version + '.zip', xwhash)%}
xways-already-downloaded-and-hash-verified-download-only:
  test.nop
{% else %}
xways-download-only:
  cmd.run:
    - name: 'Invoke-WebRequest -Uri "http://www.x-ways.net/xwf/xw_forensics{{ nodot }}.zip" -Method GET -Headers @{ Authorization = "Basic {{ auth_token }}" } -UserAgent "IPWorks HTTPComponent - www.nsoftware.com" -UseBasicParsing -OutFile {{ downloads }}\x-ways\xways-{{ version }}.zip'
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
