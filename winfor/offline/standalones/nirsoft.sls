# Name: Nirsoft
# Website: https://nirsoft.net
# Description: Suite of various Windows Analysis Tools
# Category: Windows Analysis
# Author: Nir Sofer
# License: Freeware, except for NK2Edit which requires a commercial license for organizational use (https://launcher.nirsoft.net/ - License Conditions)
# Version: 1.30.24
# Notes: 

{% set version = '1.30.24' %}
{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set downloads = salt['pillar.get']('offline', 'C:\winfor-downloads') %}
{% set PROGRAMDATA = salt['environ.get']('PROGRAMDATA') %}
{% set nlps = ['eztools.nlp', 'mitec.nlp', 'sysinternals6.nlp'] %}
{% set defender_status = salt['cmd.powershell']('((Get-Service) -match "WinDefend").Name') %}
{% set pkg = 'nirsoft-'~ version ~'.zip' %}
{% set exists = salt['file.file_exists'](downloads + '\\nirsoft\\' + pkg) %}

{% if exists %}

include:
  - winfor.offline.packages.7zip
  - winfor.offline.standalones.sysinternals
  - winfor.offline.standalones.mitec

{% if defender_status.lower() == "windefend" %}
nirsoft-defender-exclusion-offline:
  cmd.run:
    - names:
      - 'echo "Defender is present on the system."'
      - 'Add-MpPreference -ExclusionPath "{{ inpath }}"'
    - shell: powershell
{% else %}

"Defender is not present on the system - no exclusions required for Nirsoft in offline mode.":
  test.nop

{% endif %}

nirsoft-extract-offline:
  cmd.run:
    - name: '"C:\Program Files\7-Zip\7z.exe" x {{ downloads }}\nirsoft\{{ pkg }} -o"{{ inpath }}\nirsoft\" -pnirsoft9876$ -y'
    - shell: cmd
    - require:
      - sls: winfor.offline.packages.7zip

nirsoft-nirlauncher-shortcut-offline:
  file.shortcut:
    - name: '{{ PROGRAMDATA }}\Microsoft\Windows\Start Menu\Programs\NirLauncher.lnk'
    - target: '{{ inpath }}\nirsoft\NirLauncher.exe'
    - force: True
    - working_dir: '{{ inpath }}\nirsoft\'
    - makedirs: True
    - require:
      - cmd: nirsoft-extract-offline

nirsoft-cfg-replace-offline:
  file.managed:
    - name: '{{ inpath }}\nirsoft\NirLauncher.cfg'
    - source: '{{ downloads }}\nirsoft\NirLauncher.cfg'
    - replace: True
    - require:
      - cmd: nirsoft-extract-offline
      - sls: winfor.offline.standalones.sysinternals
      - sls: winfor.offline.standalones.mitec

{% for nlp in nlps %}

nirsoft-{{ nlp }}-offline:
  file.managed:
    - name: '{{ inpath }}\nirsoft\{{ nlp }}'
    - source: '{{ downloads }}\nirsoft\{{ nlp }}'
    - makedirs: True
    - require:
      - cmd: nirsoft-extract-offline

nirsoft-{{ nlp }}-replace-placeholder-offline:
  file.replace:
    - name: '{{ inpath }}\nirsoft\{{ nlp }}'
    - pattern: PLACEHOLDER_PATH
    - repl: {{ inpath | regex_escape }}
    - require:
      - file: nirsoft-{{ nlp }}-offline
      - cmd: nirsoft-extract-offline

{% endfor %}

{% else %}
{{ pkg }} does not exist - not installing:
  test.nop
{% endif %}
