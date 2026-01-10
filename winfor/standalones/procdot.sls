# Name: ProcDOT
# Website: https://www.procdot.com
# Description: Visual analysis of Windows-based malware
# Category: Executables
# Author: Christian Wojner
# License: Internet Systems Consortium (ISC - https://www.procdot.com/faqs.htm, https://www.procdot.com/webhelp/index.html?license.htm)
# Version: 1.22 (build 57)
# Notes: Requires Windows Graphviz and Windump/TCPDump, but Windump/TCPDump are not supported on Win10+

{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set version = '1_22_57' %}
{% set hash = '927cd36dbb4dc0be94afb6021ca7f747dd3f17aad383583bc71aa6e36a762849' %}
{% set PROGRAMDATA = salt['environ.get']('PROGRAMDATA') %}
{% set defender_status = salt['cmd.powershell']('((Get-Service) -match "WinDefend").Name') %}

include:
  - winfor.packages.7zip
  - winfor.packages.graphviz

{% if defender_status.lower() == "windefend" %}
procdot-defender-exclusion:
  cmd.run:
    - names:
      - 'echo "Defender is present on the system."'
      - 'Add-MpPreference -ExclusionPath "{{ inpath }}"'
      - 'Add-MpPreference -ExclusionPath "C:\salt\tempdownload"'
      - 'Add-MpPreference -ExclusionPath "{{ PROGRAMDATA }}\Salt Project\Salt\var"'
    - shell: powershell

{% else %}

"Defender is not present on the system - no exclusions required for procdot.":
  test.nop

{% endif %}

procdot-download:
  file.managed:
    - name: 'C:\salt\tempdownload\procdot_{{ version }}_windows.zip'
    - source: https://www.procdot.com/download/procdot/binaries/procdot_{{ version }}_windows.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True

procdot-extract:
  cmd.run:
    - name: '"C:\Program Files\7-Zip\7z.exe" x C:\salt\tempdownload\procdot_{{ version }}_windows.zip -o"{{ inpath }}\procdot\" -pprocdot -y'
    - shell: cmd
    - require:
      - file: procdot-download
      - sls: winfor.packages.7zip
      - sls: winfor.packages.graphviz

standalones-procdot-shortcut:
  file.shortcut:
    - name: '{{ PROGRAMDATA }}\Microsoft\Windows\Start Menu\Programs\ProcDOT x64.lnk'
    - target: '{{ inpath }}\procdot\win64\procdot.exe'
    - force: True
    - working_dir: '{{ inpath }}\procdot\win64\'
    - makedirs: True
    - require:
      - cmd: procdot-extract
