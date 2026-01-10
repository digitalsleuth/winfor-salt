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
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set PROGRAMDATA = salt['environ.get']('PROGRAMDATA') %}
{% set defender_status = salt['cmd.powershell']('((Get-Service) -match "WinDefend").Name') %}

{% if defender_status.lower() == "windefend" %}

procdot-defender-exclusion-download-only:
  cmd.run:
    - names:
      - 'echo "Defender is present on the system."'
      - 'Add-MpPreference -ExclusionPath "{{ downloads }}"'
      - 'Add-MpPreference -ExclusionPath "{{ PROGRAMDATA }}\Salt Project\Salt\var"'
    - shell: powershell
{% else %}

"Defender is not present on the system - no exclusions required to download procdot.":
  test.nop

{% endif %}

procdot-download-only:
  file.managed:
    - name: '{{ downloads }}\procdot\procdot_{{ version }}_windows.zip'
    - source: https://www.procdot.com/download/procdot/binaries/procdot_{{ version }}_windows.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True
