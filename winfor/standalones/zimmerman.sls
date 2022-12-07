# Name: Zimmerman Tools
# Website: https://ericzimmerman.github.io
# Description: Suite of Forensic Tools
# Category: Windows Analysis
# Author: Eric Zimmerman
# License: MIT License (https://github.com/EricZimmerman/Issues/blob/master/LICENSE)
# Version: 2021-01-22
# Notes: 

{% set hash = '7864ce0ab57e3831bad24f56abc1c9c6796a552091d2f49262e66565e66c0447' %}
{% set PROGRAMDATA = salt['environ.get']('PROGRAMDATA') %}
{% set applications = ['EZViewer','JumpListExplorer','MFTExplorer','RegistryExplorer','SDBExplorer','ShellBagsExplorer','TimelineExplorer'] %}

zimmerman-tools:
  file.managed:
    - name: 'C:\salt\tempdownload\Get-ZimmermanTools.zip'
    - source: https://f001.backblazeb2.com/file/EricZimmermanTools/Get-ZimmermanTools.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True

zimmerman-tools-install:
  archive.extracted:
    - name: 'C:\standalone\zimmerman\'
    - source: 'C:\salt\tempdownload\Get-ZimmermanTools.zip'
    - enforce_toplevel: False
    - watch:
      - file: zimmerman-tools

zimmerman-tools-download:
  cmd.run:
    - name: "powershell -ep bypass C:\\standalone\\zimmerman\\Get-ZimmermanTools.ps1 -Dest C:\\standalone\\zimmerman"
    - shell: powershell

zimmerman-env-vars:
  win_path.exists:
    - names:
      - 'C:\standalone\zimmerman\net6\'
      - 'C:\standalone\zimmerman\net6\EvtxeCmd\'
      - 'C:\standalone\zimmerman\net6\RECmd\'
      - 'C:\standalone\zimmerman\net6\RegistryExplorer\'
      - 'C:\standalone\zimmerman\net6\ShellBagsExplorer\'
      - 'C:\standalone\zimmerman\net6\SQLECmd\'
      - 'C:\standalone\zimmerman\net6\iisGeolocate\'
      - 'C:\standalone\zimmerman\net6\SDBExplorer\'

{% for application in applications %}
zimmerman-{{ application }}-shortcut:
  file.shortcut:
    - name: '{{ PROGRAMDATA }}\Microsoft\Windows\Start Menu\Programs\{{ application }}.lnk'
    - target: 'C:\standalone\zimmerman\net6\{{ application }}\{{ application }}.exe'
    - force: True
    - working_dir: 'C:\standalone\zimmerman\net6\{{ application }}\'
    - makedirs: True
    - require:
      - cmd: zimmerman-tools-download
{% endfor %}

zimmerman-hasher-shortcut:
  file.shortcut:
    - name: '{{ PROGRAMDATA }}\Microsoft\Windows\Start Menu\Programs\Hasher.lnk'
    - target: 'C:\standalone\zimmerman\Hasher\Hasher.exe'
    - force: True
    - working_dir: 'C:\standalone\zimmerman\Hasher\'
    - makedirs: True
    - require:
      - cmd: zimmerman-tools-download
