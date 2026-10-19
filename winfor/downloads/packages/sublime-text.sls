# Name: Sublime Text
# Website: https://www.sublimetext.com
# Description: Text Editor for markup and code
# Category: Documents / Editors
# Author: Sublime HQ Pty Ltd
# License: EULA (https://www.sublimehq.com/eula)
# Version: 4200
# Notes: 

{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set version = '4200' %}
{% from 'winfor/_macros/hashes.jinja' import get_hash %}
{% set hash = get_hash('sublime-text') %}

sublime-text-download-only:
  file.managed:
    - name: '{{ downloads }}\sublime-text\sublime-text-{{ version }}.exe'
    - source: https://download.sublimetext.com/sublime_text_build_{{ version }}_x64_setup.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True
