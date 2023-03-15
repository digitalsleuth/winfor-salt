# Name: Hibernation-Recon
# Website: https://arsenalrecon.com
# Description: Tool to parse a Windows hibernation file
# Category: Windows Analysis
# Author: Arsenal Recon
# License: EULA
# Version: 1.2.2.85
# Notes:

{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set hash = '60BB6C8C6F24FDBBBB2A3EAA1F9601F21ED36327F57735FE3E8F3E25C6619AD6' %}
{% set version = '1.2.2.85' %}
{% set file_value = 'PowEiY4S#2T087NqeVypCD77MmINi7jEoDKOPsVpnRMwQJKXQZys' %}
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
