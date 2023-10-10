# Name: Nirsoft
# Website: https://nirsoft.net
# Description: Suite of various Windows Analysis Tools
# Category: Windows Analysis
# Author: Nir Sofer
# License: 
# Version: 1.30.6
# Notes: 

{% set version = '1.30.6' %}
{% set hash = '974689a110f00bd43ee30f060cb8489eee59c6b71037f8fd7a68658b8a5b7900' %}
{% set nlps = ['eztools.nlp', 'mitec.nlp', 'sysinternals6.nlp'] %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

nirsoft-defender-exclusion-download-only:
  cmd.run:
    - names:
      - 'Add-MpPreference -ExclusionPath "{{ downloads }}\"'
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
