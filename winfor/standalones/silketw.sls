# Name: SilkETW
# Website: https://github.com/mandiant/SilkETW
# Description: Wrapper for ETW (Event Tracing for Windows)
# Category: Windows Analysis
# Author: Mandiant
# License: Apache License v2 (https://github.com/mandiant/SilkETW/raw/master/LICENSE.txt) 3rd-party license (https://github.com/mandiant/SilkETW/blob/master/LICENSE-3RD-PARTY.txt)
# Version: 0.8
# Notes: Sample Usage - https://www.mandiant.com/resources/blog/silketw-because-free-telemetry-is-free

{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}

silketw-download:
  file.managed:
    - name: 'C:\salt\tempdownload\SilkETW_SilkService_v8.zip'
    - source: https://github.com/mandiant/SilkETW/releases/download/v0.8/SilkETW_SilkService_v8.zip
    - source_hash: sha256=6c612c406844c72cde51bcd0660ca6bb704656549043cb5a8b8bbba5fe3d8dc3
    - makedirs: True

silketw-extract:
  archive.extracted:
    - name: '{{ inpath }}\silketw'
    - source: 'C:\salt\tempdownload\SilkETW_SilkService_v8.zip'
    - enforce_toplevel: False
    - require:
      - file: silketw-download

silketw-env-vars:
  win_path.exists:
    - names:
      - '{{ inpath }}\silketw\v8\SilkETW\'
      - '{{ inpath }}\silketw\v8\SilkService\'
