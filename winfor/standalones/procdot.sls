# Name: ProcDOT
# Website: https://www.procdot.com
# Description: Visual analysis of Windows-based malware
# Category: Executables
# Author: Christian Wojner
# License: Internet Systems Consortium (ISC - https://www.procdot.com/faqs.htm, https://www.procdot.com/webhelp/index.html?license.htm)
# Version: 1.22 (build 57)
# Notes: Requires Windows Graphviz and Windump/TCPDump, but Windump/TCPDump are not supported on Win10+

{% set version = '1_22_57' %}
{% set hash = '927cd36dbb4dc0be94afb6021ca7f747dd3f17aad383583bc71aa6e36a762849' %}
{% set PROGRAMDATA = salt['environ.get']('PROGRAMDATA') %}

include:
  - winfor.packages.7zip
  - winfor.packages.graphviz

procdot-defender-exclusion:
  cmd.run:
    - name: 'Add-MpPreference -ExclusionPath "C:\standalone\"'
    - shell: powershell

procdot-download:
  file.managed:
    - name: 'C:\salt\tempdownload\procdot_{{ version }}_windows.zip'
    - source: https://www.procdot.com/download/procdot/binaries/procdot_{{ version }}_windows.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True
    - require:
      - cmd: procdot-defender-exclusion
    - watch:
      - cmd: procdot-defender-exclusion

procdot-extract:
  cmd.run:
    - name: '"C:\Program Files\7-Zip\7z.exe" x C:\salt\tempdownload\procdot_{{ version }}_windows.zip -o"C:\standalone\procdot\" -pprocdot -y'
    - shell: cmd
    - require:
      - file: procdot-download
      - sls: winfor.packages.7zip
      - sls: winfor.packages.graphviz

winfor-standalones-procdot-shortcut:
  file.shortcut:
    - name: '{{ PROGRAMDATA }}\Microsoft\Windows\Start Menu\Programs\ProcDOT x64.lnk'
    - target: 'C:\standalone\procdot\win64\procdot.exe'
    - force: True
    - working_dir: 'C:\standalone\procdot\win64\'
    - makedirs: True
    - require:
      - cmd: procdot-extract
