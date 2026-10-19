# Name: SilkETW
# Website: https://github.com/mandiant/SilkETW
# Description: Wrapper for ETW (Event Tracing for Windows)
# Category: Windows Analysis
# Author: Mandiant
# License: Apache License v2 (https://github.com/mandiant/SilkETW/raw/master/LICENSE.txt) 3rd-party license (https://github.com/mandiant/SilkETW/blob/master/LICENSE-3RD-PARTY.txt)
# Version: 0.8
# Notes: Sample Usage - https://www.mandiant.com/resources/blog/silketw-because-free-telemetry-is-free

{% set version = '0.8' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% from 'winfor/_macros/hashes.jinja' import get_hash %}
{% set hash = get_hash('silketw') %}

silketw-download-only:
  file.managed:
    - name: '{{ downloads }}\silketw\silketw-{{ version }}.zip'
    - source: https://github.com/mandiant/SilkETW/releases/download/v{{ version }}/SilkETW_SilkService_v8.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True
