# Name: Zimmerman Tools
# Website: https://ericzimmerman.github.io
# Description: Suite of Forensic Tools
# Category: Windows Analysis
# Author: Eric Zimmerman
# License: MIT License (https://github.com/EricZimmerman/Issues/blob/master/LICENSE)
# Version: 2025-05-29
# Notes: 

{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set hash = 'e9993b590056016e75972ec34b25864fc7f88f574f15cf87f65b990177a1516c' %}
{% set hasher_hash = '1fa5f2e91eed2c819a107a160a56d6cc3e12807355741db6dde4395cb6d527bf' %}
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
    - name: '{{ inpath }}\zimmerman\net9\{{ tool }}\{{ tool }}.exe --sync'
    - shell: cmd
    - require:
      - cmd: zimmerman-tools-download
{% endfor %}

zimmerman-env-vars:
  win_path.exists:
    - names:
      - '{{ inpath }}\zimmerman\net9\'
      - '{{ inpath }}\zimmerman\net9\EvtxeCmd\'
      - '{{ inpath }}\zimmerman\net9\RECmd\'
      - '{{ inpath }}\zimmerman\net9\RegistryExplorer\'
      - '{{ inpath }}\zimmerman\net9\ShellBagsExplorer\'
      - '{{ inpath }}\zimmerman\net9\SQLECmd\'
      - '{{ inpath }}\zimmerman\net9\iisGeolocate\'
      - '{{ inpath }}\zimmerman\net9\SDBExplorer\'

{% for application in applications %}
zimmerman-{{ application }}-shortcut:
  file.shortcut:
    - name: '{{ PROGRAMDATA }}\Microsoft\Windows\Start Menu\Programs\{{ application }}.lnk'
    - target: '{{ inpath }}\zimmerman\net9\{{ application }}\{{ application }}.exe'
    - force: True
    - working_dir: '{{ inpath }}\zimmerman\net9\{{ application }}\'
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
