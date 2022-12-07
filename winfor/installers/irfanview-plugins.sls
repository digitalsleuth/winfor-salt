# Name: IrfanView x64 Plugins
# Website: https://www.irfanview.com/64bit.htm
# Description: IrfanView Plugins
# Category: Utilities
# Author: Irfan Skiljan
# License: https://www.irfanview.com/eula.htm
# Version: 4.60
# Notes:

{% set version = '460' %}
{% set hash = '2b5c2e165ea676546a4edeee3b856923eb9a16a9ddbc679fe3995ddebf856f9e' %}

include:
  - winfor.packages.irfanview

irfanview-plugins-source:
  file.managed:
    - name: 'C:\salt\tempdownload\iview{{ version }}_plugins_x64_setup.exe'
    - source: https://download.betanews.com/download/1099412658-1/iview{{ version }}_plugins_x64_setup.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True

irfanview-plugins-install:
  cmd.run:
    - name: 'C:\salt\tempdownload\iview{{ version }}_plugins_x64_setup.exe /silent'
    - shell: cmd
    - require:
      - sls: winfor.packages.irfanview
