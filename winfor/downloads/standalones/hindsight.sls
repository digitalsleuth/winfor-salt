# Name: Hindsight
# Website: https://github.com/obsidianforensics/hindsight
# Description: Web-based Chromium Browser artifact parser (Chrome origins)
# Category: Windows Analysis
# Author: Obsidian Forensics
# License: Apache v2.0 (https://github.com/obsidianforensics/hindsight/blob/master/LICENSE.md)
# Version: 2026.04
# Notes:

{% set version = '2026.04' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set files = [('hindsight', '1c1df0399ac0f7f5140cbeed8077205bff5335e6ba356e53c59488abba38b00e'),
                ('hindsight_gui', 'c3bbf468992db37512a3f92cf5e8a11532f1a6fd016e36215e0755473fca3907')] %}

{% for file, hash in files %}
hindsight-download-{{ file }}-only:
  file.managed:
    - name: '{{ downloads }}\hindsight\{{ file }}-{{ version }}.exe'
    - source: https://github.com/obsidianforensics/hindsight/releases/download/v{{ version }}/{{ file }}.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True
    - replace: True
{% endfor %}
