# Name: IrfanView x64
# Website: https://www.irfanview.com/64bit.htm
# Description: IrfanView image viewer and editor
# Category: Utilities
# Author: Irfan Skiljan
# License: https://www.irfanview.com/eula.htm
# Version: 4.73
# Notes:

{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set version = '473' %}
{% set hash = '724E0A7AA97D10AD76843552DDF648521F60F2809398F7CA9AD4AE4726010E08' %}

irfanview-download-only:
  file.managed:
    - name: '{{ downloads }}\irfanview\iview{{ version }}_x64_setup.exe'
    - source: https://download.fileforum.com/download/967963863-1/iview{{ version }}_x64_setup.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True
