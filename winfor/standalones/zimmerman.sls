# Name: Zimmerman Tools
# Website: https://ericzimmerman.github.io
# Description: Suite of Forensic Tools
# Category: Windows Analysis
# Author: Eric Zimmerman
# License: MIT License (https://github.com/EricZimmerman/Issues/blob/master/LICENSE)
# Version: 2024-10-28
# Notes: 

{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set hash = '7ccb8de9821339bad495e03821e870c0c2bb6d5b99e71d90ff4730e1b63e28bd' %}
{% set hasher_hash = '14ee103793fae4f165adc5e0a9424ca75ea0a4dc2e823dcc2b7cdeb2ae94483c' %}
{% set PROGRAMDATA = salt['environ.get']('PROGRAMDATA') %}
{% set applications = ['EZViewer','JumpListExplorer','MFTExplorer','RegistryExplorer','SDBExplorer','ShellBagsExplorer','TimelineExplorer'] %}
{% set sync_tools = ['EvtxECmd','RECmd'] %}

zimmerman-tools:
  file.managed:
    - name: 'C:\salt\tempdownload\Get-ZimmermanTools.zip'
    - source: https://f001.backblazeb2.com/file/EricZimmermanTools/Get-ZimmermanTools.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True

zimmerman-tools-install:
  archive.extracted:
    - name: '{{ inpath }}\zimmerman\'
    - source: 'C:\salt\tempdownload\Get-ZimmermanTools.zip'
    - enforce_toplevel: False
    - watch:
      - file: zimmerman-tools

zimmerman-tools-download:
  cmd.run:
    - name: 'powershell -nop -ep bypass -File Get-ZimmermanTools.ps1 -Dest {{ inpath }}\zimmerman'
    - cwd: {{ inpath }}\zimmerman
    - shell: powershell
    - watch:
      - archive: zimmerman-tools-install

{% for tool in sync_tools %}
zimmerman-tools-sync-{{ tool }}:
  cmd.run:
    - name: '{{ inpath }}\zimmerman\net6\{{ tool }}\{{ tool }}.exe --sync'
    - shell: cmd
    - require:
      - cmd: zimmerman-tools-download
{% endfor %}

zimmerman-env-vars:
  win_path.exists:
    - names:
      - '{{ inpath }}\zimmerman\net6\'
      - '{{ inpath }}\zimmerman\net6\EvtxeCmd\'
      - '{{ inpath }}\zimmerman\net6\RECmd\'
      - '{{ inpath }}\zimmerman\net6\RegistryExplorer\'
      - '{{ inpath }}\zimmerman\net6\ShellBagsExplorer\'
      - '{{ inpath }}\zimmerman\net6\SQLECmd\'
      - '{{ inpath }}\zimmerman\net6\iisGeolocate\'
      - '{{ inpath }}\zimmerman\net6\SDBExplorer\'

{% for application in applications %}
zimmerman-{{ application }}-shortcut:
  file.shortcut:
    - name: '{{ PROGRAMDATA }}\Microsoft\Windows\Start Menu\Programs\{{ application }}.lnk'
    - target: '{{ inpath }}\zimmerman\net6\{{ application }}\{{ application }}.exe'
    - force: True
    - working_dir: '{{ inpath }}\zimmerman\net6\{{ application }}\'
    - makedirs: True
    - require:
      - cmd: zimmerman-tools-download
{% endfor %}

zimmerman-hasher-download:
  file.managed:
    - name: 'C:\salt\tempdownload\hasher.zip'
    - source: https://download.mikestammer.com/hasher.zip
    - source_hash: sha256={{ hasher_hash }}
    - makedirs: True

zimmerman-hasher-extract:
  archive.extracted:
    - name: '{{ inpath }}\zimmerman\'
    - source: 'C:\salt\tempdownload\hasher.zip'
    - enforce_toplevel: False
    - watch:
      - file: zimmerman-hasher-download

zimmerman-hasher-shortcut:
  file.shortcut:
    - name: '{{ PROGRAMDATA }}\Microsoft\Windows\Start Menu\Programs\Hasher.lnk'
    - target: '{{ inpath }}\zimmerman\Hasher\Hasher.exe'
    - force: True
    - working_dir: '{{ inpath }}\zimmerman\Hasher\'
    - makedirs: True
    - require:
      - cmd: zimmerman-tools-download
      - archive: zimmerman-hasher-extract

zimmerman-folder-shortcut:
  file.shortcut:
    - name: '{{ PROGRAMDATA }}\Microsoft\Windows\Start Menu\Programs\Zimmerman Tools.lnk'
    - target: '{{ inpath }}\zimmerman\'
    - force: True
    - working_dir: '{{ inpath }}\zimmerman\'
    - makedirs: True
    - require:
      - cmd: zimmerman-tools-download
