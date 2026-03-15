# Name: Hindsight
# Website: https://github.com/obsidianforensics/hindsight
# Description: Web-based Chromium Browser artifact parser (Chrome origins)
# Category: Windows Analysis
# Author: Obsidian Forensics
# License: Apache v2.0 (https://github.com/obsidianforensics/hindsight/blob/master/LICENSE.md)
# Version: 2026.01
# Notes:

{% set version = '2026.01' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set files = [('hindsight.exe', '823d18cba5112874d4fbee7e3fb05de679fb708d45d0b7cad9ec7ee7f687d36b'),
                ('hindsight_gui.exe', 'ac5fea980f66188e3db26831154620885edda7d350716e42738a0728e66eaa86')] %}

{% for file, hash in files %}
hindsight-download-{{ file }}-only:
  file.managed:
    - name: '{{ downloads }}\hindsight\{{ version }}\{{ file }}'
    - source: https://github.com/obsidianforensics/hindsight/releases/download/v{{ version }}/{{ file }}
    - source_hash: sha256={{ hash }}
    - makedirs: True
    - replace: True
{% endfor %}
