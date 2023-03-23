# Name: Sublime Text
# Website: https://www.sublimetext.com
# Description: Text Editor for markup and code
# Category: Documents / Editors
# Author: Sublime HQ Pty Ltd
# License: EULA (https://www.sublimehq.com/eula)
# Version: 4143
# Notes: 

{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set version = '4143' %}
{% set hash = 'cb80fc92c7a94ae7d8ad48eedcf117b7a044eb921ae3b070e56c749081bab5e3' %}

sublime-text-download-only:
  file.managed:
    - name: '{{ downloads }}\sublime_text_build_{{ version }}_x64_setup.exe'
    - source: https://download.sublimetext.com/sublime_text_build_{{ version }}_x64_setup.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True
