# Name: Zimmerman Tools
# Website: https://ericzimmerman.github.io
# Description: Suite of Forensic Tools
# Category: Windows Analysis
# Author: Eric Zimmerman
# License: MIT License (https://github.com/EricZimmerman/Issues/blob/master/LICENSE)
# Version: 2026.5.0
# Notes: 

{% set version = '2026.5.0' %}
{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set downloads = salt['pillar.get']('offline', 'C:\winfor-downloads') %}
{% set PROGRAMDATA = salt['environ.get']('PROGRAMDATA') %}
{% set applications = ['EZViewer','JumpListExplorer','MFTExplorer','RegistryExplorer','SDBExplorer','ShellBagsExplorer','TimelineExplorer'] %}
{% set sync_tools = ['EvtxECmd','RECmd'] %}
{% set shim_paths = ['AmcacheParser.exe', 'AppCompatCacheParser.exe', 'bstrings.exe', 'JLECmd.exe', 'LECmd.exe', 'MFTECmd.exe', 'EvtxeCmd\EvtxeCmd.exe', 'iisGeolocate\iisGeolocate.exe', 'RECmd\RECmd.exe', 'SQLECmd\SQLECmd.exe', 'PECmd.exe', 'RBCmd.exe', 'rla.exe', 'SBECmd.exe', 'SrumECmd.exe', 'SumECmd.exe','VSCMount.exe', 'WxTCmd.exe', 'RecentFileCacheParser.exe'] %}

include:
  - winfor.offline.packages.dotnet9-desktop-runtime
  - winfor.config.shims

zimmerman-folder-move-offline:
  file.rename:
    - name: '{{ inpath }}\zimmerman'
    - source: '{{ downloads }}\zimmerman\zimmerman-{{ version }}\'
    - force: True
    - makedirs: True

{% for tool in shim_paths %}
zimmerman-{{ tool.split("\\")[0].split(".exe")[0] }}-shim-offline:
  cmd.run:
    - name: 'powershell -nop -ep Bypass -File {{ inpath }}\\New-Shim.ps1 -SourceExe {{ inpath }}\\zimmerman\\net9\\{{ tool }} -OutPath {{ inpath }}\\shims\\{{ tool.split("\\")[-1] }}'
    - require:
      - sls: winfor.config.shims
      - file: zimmerman-folder-move-offline
{% endfor %}

{% for application in applications %}
zimmerman-{{ application }}-shortcut:
  file.shortcut:
    - name: '{{ PROGRAMDATA }}\Microsoft\Windows\Start Menu\Programs\{{ application }}.lnk'
    - target: '{{ inpath }}\zimmerman\net9\{{ application }}\{{ application }}.exe'
    - force: True
    - working_dir: '{{ inpath }}\zimmerman\net9\{{ application }}\'
    - makedirs: True
    - require:
      - file: zimmerman-folder-move-offline
 
{% endfor %}

zimmerman-hasher-extract-offline:
  archive.extracted:
    - name: '{{ inpath }}\zimmerman\'
    - source: '{{ downloads }}\zimmerman\hasher-{{ version }}.zip'
    - enforce_toplevel: False

zimmerman-hasher-shortcut-offline:
  file.shortcut:
    - name: '{{ PROGRAMDATA }}\Microsoft\Windows\Start Menu\Programs\Hasher.lnk'
    - target: '{{ inpath }}\zimmerman\Hasher\Hasher.exe'
    - force: True
    - working_dir: '{{ inpath }}\zimmerman\Hasher\'
    - makedirs: True
    - require:
      - archive: zimmerman-hasher-extract-offline
      - file: zimmerman-folder-move-offline

zimmerman-folder-shortcut-offline:
  file.shortcut:
    - name: '{{ PROGRAMDATA }}\Microsoft\Windows\Start Menu\Programs\Zimmerman Tools.lnk'
    - target: '{{ inpath }}\zimmerman\'
    - force: True
    - working_dir: '{{ inpath }}\zimmerman\'
    - makedirs: True
    - require:
      - file: zimmerman-folder-move-offline
