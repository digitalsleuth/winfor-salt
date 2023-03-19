# Name: Hibernation-Recon
# Website: https://arsenalrecon.com
# Description: Tool to parse a Windows hibernation file
# Category: Windows Analysis
# Author: Arsenal Recon
# License: EULA
# Version: 1.2.2.86
# Notes:

{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set hash = 'de71fb354e5d9a6193c165f18d775819f1277014a7317371cdec14060857f606' %}
{% set version = '1.2.2.86' %}
{% set file_value = 'z4Q2iD4C#1I8eFUnuV-x-OOuFJ7G-8YWcNPDfrV26w3aL2mnqGPI' %}
{% set PROGRAMDATA = salt['environ.get']('PROGRAMDATA') %}

include:
  - winfor.standalones.megatools
  - winfor.packages.dotnet6-desktop-runtime

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

standalones-hiber-recon-path:
  win_path.exists:
    - name: '{{ inpath }}\hibernation-recon\'
    - require:
      - file: standalones-hiber-recon-shortcut
