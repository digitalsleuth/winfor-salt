# Name: Nirsoft
# Website: https://nirsoft.net
# Description: Suite of various Windows Analysis Tools
# Category: Windows Analysis
# Author: Nir Sofer
# License: 
# Version: 1.30.14
# Notes: 

{% set version = '1.30.14' %}
{% set hash = '7969d1c07f5cef6392bcc2e250a59cf04bef31726b4aca0542f0b52a63144330' %}
{% set nlps = ['eztools.nlp', 'mitec.nlp', 'sysinternals6.nlp'] %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set PROGRAMDATA = salt['environ.get']('PROGRAMDATA') %}
{% set defender_status = salt['cmd.run']('powershell -c "(Get-Service windefend).Status"') %}

nirsoft-defender-exclusion-download-only:
  cmd.run:
{% if defender_status == "Running" %}
    - names:
      - 'echo "Defender is {{ defender_status }}"'
      - 'Add-MpPreference -ExclusionPath "{{ downloads }}"'
      - 'Add-MpPreference -ExclusionPath "{{ PROGRAMDATA }}\Salt Project\Salt\var"'
{% else %}
    - name:
      - 'echo "Defender is {{ defender_status }}"'
{% endif %}
    - shell: powershell

nirsoft-folder:
  file.directory:
    - name: '{{ downloads }}\nirsoft'
    - win_inheritance: True

nirsoft-download-only:
  cmd.run:
    - name: 'wget -O {{ downloads }}\nirsoft\nirsoft_package_enc_{{ version }}.zip -Headers @{"Referer"="https://launcher.nirsoft.net/downloads/index.html"} https://download.nirsoft.net/nirsoft_package_enc_{{ version }}.zip'
    - shell: powershell
    - require:
      - cmd: nirsoft-defender-exclusion-download-only
      - file: nirsoft-folder

standalones-nirsoft-cfg-replace-download-only:
  file.managed:
    - name: '{{ downloads }}\nirsoft\NirLauncher.cfg'
    - source: salt://winfor/files/NirLauncher.cfg
    - replace: True

{% for nlp in nlps %}

nirsoft-download-only-{{ nlp }}:
  file.managed:
    - name: '{{ downloads }}\nirsoft\{{ nlp }}'
    - source: salt://winfor/files/{{ nlp }}
    - makedirs: True

{% endfor %}
