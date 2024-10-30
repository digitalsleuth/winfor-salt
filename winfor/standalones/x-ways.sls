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
{% set PROGRAMDATA = salt['environ.get']('PROGRAMDATA') %}
{% set xwhash = "13a444d9f92853a4f17b0126c5a482557c1bc261fb46961ddbf2b5d533c9f8fb" %}
{% set xviewerhash = "00d573f24f55521869ecd896a47b1e3838e4ad24c701178b565663d79882222f" %}
{% set xviewer_ver = "857" %}
{% set mplayerhash = "9032481e21819bc02c01b11ab11ab82c022e3566eea42bf420c67def85f86fae" %}
{% set tesseracthash = "d071607267792631168d534bd89cd6905ee5d79b392542f81ab945a6e7ce72bd" %}
{% set manualhash = "ac470910b3f7c614e5f6bc91ac62bc9a9fa7657615da3721f835c5d9228735c2" %}

include:
  - winfor.standalones.x-ways-templates

{% if salt['file.directory_exists']('C:\\salt\\tempdownload\\') %}
temp-directory-exists:
  test.nop
{% else %}
create-temp-directory:
  file.directory:
    - name: 'C:\salt\tempdownload\'
    - makedirs: True
{% endif %}

{% if auth_token == "TOKENPLACEHOLDER" %}

xways-credentials-not-provided:
  test.nop

{% else %}

{% if salt['file.file_exists']('C:\\salt\\tempdownload\\xw_forensics' + version + '.zip') and salt['file.check_hash']('C:\\salt\\tempdownload\\xw_forensics' + version + '.zip', xwhash)%}
xways-already-downloaded-and-hash-verified:
  test.nop
{% else %}
xways-download:
  cmd.run:
    - name: 'Invoke-WebRequest -Uri "http://www.x-ways.net/xwf/xw_forensics{{ version }}.zip" -Method GET -Headers @{ Authorization = "Basic {{ auth_token }}" } -UserAgent "IPWorks HTTPComponent - www.nsoftware.com" -UseBasicParsing -OutFile C:\salt\tempdownload\xw_forensics{{ version }}.zip'
    - shell: powershell
{% endif %}

{% if salt['file.file_exists']('C:\\salt\\tempdownload\\xw_viewer_' + xviewer_ver + '.zip') and salt['file.check_hash']('C:\\salt\\tempdownload\\xw_viewer_' + xviewer_ver + '.zip', xviewerhash)%}
xways-viewer-already-downloaded-and-hash-verified:
  test.nop
{% else %}
xways-viewer-download:
  cmd.run:
    - name: 'Invoke-WebRequest -Uri "http://www.x-ways.net/res/viewer/xw_viewer_{{ xviewer_ver }}.zip" -Method GET -Headers @{ Authorization = "Basic {{ auth_token }}" } -UserAgent "IPWorks HTTPComponent - www.nsoftware.com" -UseBasicParsing -OutFile C:\salt\tempdownload\xw_viewer_{{ xviewer_ver }}.zip'
    - shell: powershell
{% endif %}

{% if salt['file.file_exists']('C:\\salt\\tempdownload\\Tesseract.zip') and salt['file.check_hash']('C:\\salt\\tempdownload\\Tesseract.zip', tesseracthash)%}
xways-tesseract-already-downloaded-and-hash-verified:
  test.nop
{% else %}
xways-tesseract-download:
  cmd.run:
    - name: 'Invoke-WebRequest -Uri "http://www.x-ways.net/res/Tesseract.zip" -Method GET -Headers @{ Authorization = "Basic {{ auth_token }}" } -UserAgent "IPWorks HTTPComponent - www.nsoftware.com" -UseBasicParsing -OutFile C:\salt\tempdownload\Tesseract.zip'
    - shell: powershell
{% endif %}

{% if salt['file.file_exists']('C:\\salt\\tempdownload\\MPlayer_2022_x64.zip') and salt['file.check_hash']('C:\\salt\\tempdownload\\MPlayer_2022_x64.zip', mplayerhash)%}
xways-mplayer-already-downloaded-and-hash-verified:
  test.nop
{% else %}
xways-mplayer-download:
  cmd.run:
    - name: 'Invoke-WebRequest -Uri "http://www.x-ways.net/res/mplayer/MPlayer 2022 x64.zip" -Method GET -Headers @{ Authorization = "Basic {{ auth_token }}" } -UserAgent "IPWorks HTTPComponent - www.nsoftware.com" -UseBasicParsing -OutFile C:\salt\tempdownload\MPlayer_2022_x64.zip'
    - shell: powershell
{% endif %}

{% if salt['file.file_exists']('C:\\salt\\tempdownload\\manual.pdf') and salt['file.check_hash']('C:\\salt\\tempdownload\\manual.pdf', manualhash)%}
xways-manual-already-downloaded-and-hash-verified:
  test.nop
{% else %}
xways-manual-download:
  cmd.run:
    - name: 'Invoke-WebRequest -Uri "http://www.x-ways.net/winhex/manual.pdf" -Method GET -Headers @{ Authorization = "Basic {{ auth_token }}" } -UserAgent "IPWorks HTTPComponent - www.nsoftware.com" -UseBasicParsing -OutFile C:\salt\tempdownload\manual.pdf'
    - shell: powershell
{% endif %}

xways-extract:
  archive.extracted:
    - name: 'C:\xwf\'
    - source: 'C:\salt\tempdownload\xw_forensics{{ version }}.zip'
    - enforce_toplevel: False

xways-viewer-extract:
  archive.extracted:
    - name: 'C:\xwf\'
    - source: 'C:\salt\tempdownload\xw_viewer.zip'
    - enforce_toplevel: False
    - require:
      - archive: xways-extract

xways-tesseract-extract:
  archive.extracted:
    - name: 'C:\xwf\'
    - source: 'C:\salt\tempdownload\Tesseract.zip'
    - enforce_toplevel: False
    - require:
      - archive: xways-extract

xways-mplayer-extract:
  archive.extracted:
    - name: 'C:\xwf\'
    - source: 'C:\salt\tempdownload\MPlayer_2022_x64.zip'
    - enforce_toplevel: False
    - require:
      - archive: xways-extract

xways-manual-copy:
  file.managed:
    - name: 'C:\xwf\manual.pdf'
    - source: 'C:\salt\tempdownload\manual.pdf'
    - require:
      - archive: xways-extract

xways-winhex-binary:
  file.copy:
    - name: 'C:\xwf\winhex.exe'
    - source: 'C:\xwf\xwforensics.exe'
    - require:
      - archive: xways-extract

xways-winhex64-binary:
  file.copy:
    - name: 'C:\xwf\winhex64.exe'
    - source: 'C:\xwf\xwforensics64.exe'
    - require:
      - archive: xways-extract

standalones-xways-shortcut:
  file.shortcut:
    - name: '{{ PROGRAMDATA }}\Microsoft\Windows\Start Menu\Programs\X-Ways.lnk'
    - target: 'C:\xwf\xwforensics64.exe'
    - force: True
    - working_dir: 'C:\xwf\'
    - makedirs: True
    - require:
      - archive: xways-extract

standalones-winhex-shortcut:
  file.shortcut:
    - name: '{{ PROGRAMDATA }}\Microsoft\Windows\Start Menu\Programs\WinHex.lnk'
    - target: 'C:\xwf\winhex64.exe'
    - force: True
    - working_dir: 'C:\xwf\'
    - makedirs: True
    - require:
      - archive: xways-extract

{% endif %}
