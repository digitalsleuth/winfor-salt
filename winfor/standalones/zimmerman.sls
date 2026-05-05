# Name: Zimmerman Tools
# Website: https://ericzimmerman.github.io
# Description: Suite of Forensic Tools
# Category: Windows Analysis
# Author: Eric Zimmerman
# License: MIT License (https://github.com/EricZimmerman/Issues/blob/master/LICENSE)
# Version: 2026.5.0
# Notes: 

{% set version = '2026.5.0' %}
{% set hash = '12c7e9e3990959e374feb1919590428f7044feb1de9940c454c58ff41f488094' %}
{% set hasher_hash = 'a8a343013d6ed5b6988ebce1b3a561df51ab5928bc3a0f489a7e175f8f6f89d4' %}
{% set hasher_version = '2026.5.0' %}
{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set PROGRAMDATA = salt['environ.get']('PROGRAMDATA') %}
{% set applications = ['EZViewer','JumpListExplorer','MFTExplorer','RegistryExplorer','SDBExplorer','ShellBagsExplorer','TimelineExplorer'] %}
{% set sync_tools = ['EvtxECmd','RECmd'] %}
{% set shim_paths = ['AmcacheParser.exe', 'AppCompatCacheParser.exe', 'bstrings.exe', 'JLECmd.exe', 'LECmd.exe', 'MFTECmd.exe', 'EvtxeCmd\EvtxeCmd.exe', 'iisGeolocate\iisGeolocate.exe', 'RECmd\RECmd.exe', 'SQLECmd\SQLECmd.exe', 'PECmd.exe', 'RBCmd.exe', 'rla.exe', 'SBECmd.exe', 'SrumECmd.exe', 'SumECmd.exe','VSCMount.exe', 'WxTCmd.exe', 'RecentFileCacheParser.exe'] %}
include:
  - winfor.packages.dotnet9-desktop-runtime
  - winfor.config.shims

zimmerman-tools:
  file.managed:
    - name: 'C:\salt\tempdownload\Get-ZimmermanTools.zip'
    - source: https://download.ericzimmermanstools.com/Get-ZimmermanTools.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True

zimmerman-tools-install:
  archive.extracted:
    - name: '{{ inpath }}\zimmerman\'
    - source: 'C:\salt\tempdownload\Get-ZimmermanTools.zip'
    - enforce_toplevel: False
    - watch:
      - file: zimmerman-tools

zimmerman-tools-fix-index-url:
  file.replace:
    - name: '{{ inpath }}\zimmerman\Get-ZimmermanTools.ps1'
    - pattern: '"https://raw.githubusercontent.com/EricZimmerman/ericzimmerman.github.io/master/index.md"'
    - repl: '"https://raw.githubusercontent.com/EricZimmerman/ericzimmerman.github.io/refs/heads/master/docs/index.md"'
    - backup: False
    - require:
      - archive: zimmerman-tools-install

zimmerman-tools-download:
  cmd.run:
    - name: '.\Get-ZimmermanTools.ps1 -Dest {{ inpath }}\zimmerman -NetVersion 9'
    - cwd: {{ inpath }}\zimmerman
    - shell: powershell
    - watch:
      - archive: zimmerman-tools-install
    - require:
      - sls: winfor.packages.dotnet9-desktop-runtime

{% for tool in sync_tools %}
zimmerman-tools-sync-{{ tool }}:
  cmd.run:
    - name: '{{ inpath }}\\zimmerman\\net9\\{{ tool }}\\{{ tool }}.exe --sync'
    - shell: cmd
    - require:
      - cmd: zimmerman-tools-download
{% endfor %}

{% for tool in shim_paths %}
zimmerman-{{ tool.split("\\")[0].split(".exe")[0] }}-shim:
  cmd.run:
    - name: 'powershell -nop -ep Bypass -File {{ inpath }}\\New-Shim.ps1 -SourceExe {{ inpath }}\\zimmerman\\net9\\{{ tool }} -OutPath {{ inpath }}\\shims\\{{ tool.split("\\")[-1] }}'
    - require:
      - sls: winfor.config.shims
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
      - cmd: zimmerman-tools-download
{% endfor %}

zimmerman-hasher-download:
  file.managed:
    - name: 'C:\salt\tempdownload\hasher.zip'
    - source: https://download.ericzimmermanstools.com/hasher.zip
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
