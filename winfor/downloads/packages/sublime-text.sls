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
{% set hash = '3d3c70e51aef08f85d7160bcc70793bed9acec250973090ab67d98987bce7c7e' %}

sublime-text-download-only:
  file.managed:
    - name: '{{ downloads }}\sublime\sublime_text_build_{{ version }}_x64_setup.exe'
    - source: https://download.sublimetext.com/sublime_text_build_{{ version }}_x64_setup.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True
