# Name: Volatility Workbench
# Website: https://www.osforensics.com/tools/volatility-workbench.html
# Description: Windows-based GUI for the Volatility 3 Framework
# Category: Windows Analysis
# Author: OSForensics
# License: Volatility Software License (https://www.volatilityfoundation.org/license/vsl-v1.0)
# Version: 3.0.1005
# Notes:

{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set version = '3.0.1005' %}
{% set hash = '75c39a4ea6415d94a0cb1f2d11c32566230d254c5fb25118dae4044a495961b5' %}

volatility-workbench-download-only:
  file.managed:
    - name: '{{ downloads }}\VolatilityWorkbench.zip'
    - source: https://www.osforensics.com/downloads/VolatilityWorkbench.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True
