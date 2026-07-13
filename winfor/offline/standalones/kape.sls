# Name: kape
# Website: https://www.kroll.com/en/services/cyber-risk/incident-response-litigation-support/kroll-artifact-parser-extractor-kape
# Description: Incident Response Artifact Parser and Extractor
# Category: Windows Analysis
# Author: Eric Zimmerman / Kroll
# License: https://www.kroll.com/en/services/cyber-risk/incident-response-litigation-support/kroll-artifact-parser-extractor-kape
# Version: 1.3.0.2
# Notes: 

{% set version = '1.3.0.2' %}
{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set downloads = salt['pillar.get']('offline', 'C:\winfor-downloads') %}
{% set PROGRAMDATA = salt['environ.get']('PROGRAMDATA') %}
{% set pkg = 'kape.exe' %}
{% set exists = salt['file.file_exists'](downloads + '\\kape\\KAPE\\' + pkg) %}

{% if exists %}

include:
  - winfor.config.shims

kape-folder-move-offline:
  file.rename:
    - name: '{{ inpath }}\kape'
    - source: '{{ downloads }}\kape\KAPE'
    - force: True
    - makedirs: True

kape-shim-offline:
  cmd.run:
    - name: 'powershell -nop -ep Bypass -File {{ inpath }}\New-Shim.ps1 -SourceExe {{ inpath }}\kape\kape.exe -OutPath {{ inpath }}\shims\kape.exe'
    - require:
      - sls: winfor.config.shims

gkape-shortcut-offline:
  file.shortcut:
    - name: '{{ PROGRAMDATA }}\Microsoft\Windows\Start Menu\Programs\gkape.lnk'
    - target: '{{ inpath }}\kape\gkape.exe'
    - force: True
    - working_dir: '{{ inpath }}\kape\'
    - makedirs: True
    - require:
      - file: kape-folder-move-offline

{% else %}
{{ pkg }} does not exist - not installing:
  test.nop
{% endif %}
