# Name: Sublime Text
# Website: https://www.sublimetext.com
# Description: Text Editor for markup and code
# Category: Documents / Editors
# Author: Sublime HQ Pty Ltd
# License: EULA (https://www.sublimehq.com/eula)
# Version: 4152
# Notes: 

{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set version = '4152' %}
{% set hash = '542bba3990a71b24e79130f91708fd6ed0847744d447823cbf1f542bae68fa4f' %}

sublime-text-download-only:
  file.managed:
    - name: '{{ downloads }}\sublime\sublime_text_build_{{ version }}_x64_setup.exe'
    - source: https://download.sublimetext.com/sublime_text_build_{{ version }}_x64_setup.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True
