# Name: Nirsoft
# Website: https://nirsoft.net
# Description: Suite of various Windows Analysis Tools
# Category: Windows Analysis
# Author: Nir Sofer
# License: 
# Version: 1.23.71
# Notes: 

{% set version = '1.23.71' %}
{% set hash = 'f79f83b03cbde407f390ea9ce0a31db494a477e446650d5528b62a233e7c927a' %}
{% set nlps = ['eztools.nlp', 'mitec.nlp', 'sysinternals6.nlp'] %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

nirsoft-defender-exclusion-download-only:
  cmd.run:
    - name: 'Add-MpPreference -ExclusionPath "{{ downloads }}\"'
    - shell: powershell

nirsoft-download-only:
  cmd.run:
    - name: 'wget -O {{ downloads }}\nirsoft_package_enc_{{ version }}.zip -Headers @{"Referer"="https://launcher.nirsoft.net/downloads/index.html"} https://download.nirsoft.net/nirsoft_package_enc_{{ version }}.zip'
    - shell: powershell
    - require:
      - cmd: nirsoft-defender-exclusion-download-only

standalones-nirsoft-cfg-replace-download-only:
  file.managed:
    - name: '{{ downloads }}\NirLauncher.cfg'
    - source: salt://winfor/files/NirLauncher.cfg
    - replace: True

{% for nlp in nlps %}

nirsoft-download-only-{{ nlp }}:
  file.managed:
    - name: '{{ downloads }}\{{ nlp }}'
    - source: salt://winfor/files/{{ nlp }}
    - makedirs: True

{% endfor %}
