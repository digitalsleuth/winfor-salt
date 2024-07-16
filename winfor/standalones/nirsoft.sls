# Name: Nirsoft
# Website: https://nirsoft.net
# Description: Suite of various Windows Analysis Tools
# Category: Windows Analysis
# Author: Nir Sofer
# License: 
# Version: 1.30.12
# Notes: 

{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set version = '1.30.12' %}
{% set hash = 'ee3f5602179491c5e673fb054e00ada820a19d42add6e8d319ff76983522ef7f' %}
{% set PROGRAMDATA = salt['environ.get']('PROGRAMDATA') %}
{% set nlps = ['eztools.nlp', 'mitec.nlp', 'sysinternals6.nlp'] %}
{% set defender_status = salt['cmd.run']('powershell -c "(Get-Service windefend).Status"') %}

include:
  - winfor.packages.7zip
  - winfor.standalones.sysinternals
  - winfor.standalones.mitec

nirsoft-defender-exclusion:
  cmd.run:
{% if defender_status == "Running" %}
    - names:
      - 'echo "Defender is {{ defender_status }}"'
      - 'Add-MpPreference -ExclusionPath "{{ inpath }}"'
      - 'Add-MpPreference -ExclusionPath "C:\salt\tempdownload"'
      - 'Add-MpPreference -ExclusionPath "{{ PROGRAMDATA }}\Salt Project\Salt\var"'
{% else %}
    - name:
      - 'echo "Defender is {{ defender_status }}"'
{% endif %}
    - shell: powershell

nirsoft-download:
  cmd.run:
    - name: 'wget -O C:\salt\tempdownload\nirsoft_package_enc_{{ version }}.zip -Headers @{"Referer"="https://launcher.nirsoft.net/downloads/index.html"} https://download.nirsoft.net/nirsoft_package_enc_{{ version }}.zip'
    - shell: powershell
    - require:
      - cmd: nirsoft-defender-exclusion

nirsoft-extract:
  cmd.run:
    - name: '"C:\Program Files\7-Zip\7z.exe" x C:\salt\tempdownload\nirsoft_package_enc_{{ version }}.zip -o"{{ inpath }}\nirsoft\" -pnirsoft9876$ -y'
    - shell: cmd
    - require:
      - cmd: nirsoft-download
      - cmd: nirsoft-defender-exclusion
    - watch:
      - cmd: nirsoft-defender-exclusion

nirsoft-env-vars:
  win_path.exists:
    - name: '{{ inpath }}\nirsoft\'
    - require:
      - cmd: nirsoft-download

nirsoft-nirlauncher-shortcut:
  file.shortcut:
    - name: '{{ PROGRAMDATA }}\Microsoft\Windows\Start Menu\Programs\NirLauncher.lnk'
    - target: '{{ inpath }}\nirsoft\NirLauncher.exe'
    - force: True
    - working_dir: '{{ inpath }}\nirsoft\'
    - makedirs: True
    - require:
      - cmd: nirsoft-extract

standalones-nirsoft-cfg-replace:
  file.managed:
    - name: '{{ inpath }}\nirsoft\NirLauncher.cfg'
    - source: salt://winfor/files/NirLauncher.cfg
    - replace: True
    - require:
      - cmd: nirsoft-extract
      - sls: winfor.standalones.sysinternals
      - sls: winfor.standalones.mitec

{% for nlp in nlps %}

standalones-nirsoft-{{ nlp }}:
  file.managed:
    - name: '{{ inpath }}\nirsoft\{{ nlp }}'
    - source: salt://winfor/files/{{ nlp }}
    - makedirs: True
    - require:
      - cmd: nirsoft-extract

standalones-nirsoft-{{ nlp }}-replace-placeholder:
  file.replace:
    - name: '{{ inpath }}\nirsoft\{{ nlp }}'
    - pattern: PLACEHOLDER_PATH
    - repl: {{ inpath | regex_escape }}
    - require:
      - file: standalones-nirsoft-{{ nlp }}
      - cmd: nirsoft-extract

{% endfor %}
