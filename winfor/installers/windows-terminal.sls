# Name: 
# Website: 
# Description: 
# Category: 
# Author: 
# License: 
# Notes: 

{% set user = salt['pillar.get']('winfor_user', 'forensics') %}
{% set version = '1.11.3471.0' %}
{% set hash = '8d4aa2585e62cdd5a1c8c3c5ed4f482f5029eace4777d247a3c728538f126f6a' %}

windows-terminal:
  file.managed:
    - name: C:\\salt\\tempdownload\\Microsoft.WindowsTerminal_{{ version }}_8wekyb3d8bbwe.msixbundle
    - source: https://github.com/microsoft/terminal/releases/download/v{{ version }}/Microsoft.WindowsTerminal_{{ version }}_8wekyb3d8bbwe.msixbundle
    - source_hash: sha256={{ hash }}
    - makedirs: True

windows-terminal-install:
  cmd.run:
    - name: "Add-AppxPackage -Path C:\\salt\\tempdownload\\Microsoft.WindowsTerminal_{{ version }}_8wekyb3d8bbwe.msixbundle"
    - shell: powershell

windows-terminal-remove-alias:
  file.absent:
    - name: 'C:\Users\{{ user }}\AppData\Local\Microsoft\WindowsApps\wt.exe'
