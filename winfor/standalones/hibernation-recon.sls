# Name: Hibernation-Recon
# Website: https://arsenalrecon.com
# Description: Tool to parse a Windows hibernation file
# Category: Windows Analysis
# Author: Arsenal Recon
# License: EULA
# Version: 1.2.3.96
# Notes:

{% set version = '1.2.3.96' %}
{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set hash = 'a7196907adb7a4fa110cab65ced57e4024f1162a051cd7d0dce1abf3cec998b6' %}
{% set file_value = 'S0AShJZC#0bAnvlQOJBZMbtOHfyN_5jrZXcimfImae4zpY6O220w' %}
{% set PROGRAMDATA = salt['environ.get']('PROGRAMDATA') %}

include:
  - winfor.standalones.megatools
  - winfor.packages.dotnet6-desktop-runtime
  - winfor.config.shims

hiber-recon-remove-previous:
  file.absent:
    - name: 'C:\salt\tempdownload\Hibernation-Recon-v{{ version }}.zip'

hiber-recon-download:
  cmd.run:
    - name: '{{ inpath }}\megatools\megatools.exe dl https://mega.nz/file/{{ file_value }} --path C:\salt\tempdownload'
    - shell: cmd
    - require:
      - sls: winfor.standalones.megatools
      - file: hiber-recon-remove-previous

hiber-recon-extract:
  archive.extracted:
    - name: '{{ inpath }}\'
    - enforce_toplevel: True
    - source: 'C:\salt\tempdownload\Hibernation-Recon-v{{ version }}.zip'
    - source_hash: sha256={{ hash }}
    - overwrite: True
    - require:
      - sls: winfor.standalones.megatools
      - cmd: hiber-recon-download
      - sls: winfor.packages.dotnet6-desktop-runtime

hiber-recon-folder-rename:
  file.rename:
    - name: '{{ inpath }}\hibernation-recon'
    - source: '{{ inpath }}\Hibernation-Recon-v{{ version }}\'
    - force: True
    - makedirs: True
    - require:
      - archive: hiber-recon-extract

standalones-hiber-recon-shortcut:
  file.shortcut:
    - name: '{{ PROGRAMDATA }}\Microsoft\Windows\Start Menu\Programs\Hibernation Recon.lnk'
    - target: '{{ inpath }}\hibernation-recon\HibernationRecon.exe'
    - force: True
    - working_dir: '{{ inpath }}\hibernation-recon\'
    - makedirs: True
    - require:
      - sls: winfor.standalones.megatools
      - cmd: hiber-recon-download
      - archive: hiber-recon-extract
      - file: hiber-recon-folder-rename

hibernation-recon-shim:
  cmd.run:
    - name: 'powershell -nop -ep Bypass -File {{ inpath }}\New-Shim.ps1 -SourceExe {{ inpath }}\hibernation-recon\HibernationRecon.exe -OutPath {{ inpath }}\shims\HibernationRecon.exe'
    - require:
      - sls: winfor.config.shims
