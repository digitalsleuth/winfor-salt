# Name: Nirsoft
# Website: https://nirsoft.net
# Description: Suite of various Windows Analysis Tools
# Category: Windows Analysis
# Author: Nir Sofer
# License: 
# Version: 1.30.22
# Notes: 

{% set version = '1.30.22' %}
{% set hash = 'c057afcf3094b407597c86209500c2f85dc41b81404372fc28ca215fc5ba4a04' %}
{% set nlps = ['eztools.nlp', 'mitec.nlp', 'sysinternals6.nlp'] %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set PROGRAMDATA = salt['environ.get']('PROGRAMDATA') %}
{% set defender_status = salt['cmd.powershell']('((Get-Service) -match "WinDefend").Name') %}

{% if defender_status.lower() == "windefend" %}
nirsoft-defender-exclusion-download-only:
  cmd.run:
    - names:
      - 'echo "Defender is present on the system."'
      - 'Add-MpPreference -ExclusionPath "{{ downloads }}"'
      - 'Add-MpPreference -ExclusionPath "{{ PROGRAMDATA }}\Salt Project\Salt\var"'
    - shell: powershell
{% else %}

"Defender is not present on the system - no exclusions required to download Nirsoft.":
  test.nop

{% endif %}

nirsoft-folder:
  file.directory:
    - name: '{{ downloads }}\nirsoft'
    - win_inheritance: True

nirsoft-download-only:
  cmd.run:
    - name: 'wget -O {{ downloads }}\nirsoft\nirsoft_package_enc_{{ version }}.zip -Headers @{"Referer"="https://launcher.nirsoft.net/downloads/index.html"} https://download.nirsoft.net/nirsoft_package_enc_{{ version }}.zip'
    - shell: powershell
    - require:
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
