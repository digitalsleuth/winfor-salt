# Name: IrfanView x64
# Website: https://www.irfanview.com/64bit.htm
# Description: IrfanView image viewer and editor
# Category: Utilities
# Author: Irfan Skiljan
# License: https://www.irfanview.com/eula.htm
# Version: 4.72
# Notes:

{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set version = '472' %}
{% set hash = 'ce109cef189ea78fb620d29f0ca61a0fa10cb9273b46c072eb858612ba35e3b4' %}

irfanview-download-only:
  file.managed:
    - name: '{{ downloads }}\irfanview\iview{{ version }}_x64_setup.exe'
    - source: https://download.betanews.com/download/967963863-1/iview{{ version }}_x64_setup.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True
