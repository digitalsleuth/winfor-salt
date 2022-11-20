# Name: Hindsight
# Website: https://github.com/obsidianforensics/hindsight
# Description: Web-based Chromium Browser artifact parser (Chrome origins)
# Category: Windows Analysis
# Author: Obsidian Forensics
# License: Apache v2.0 (https://github.com/obsidianforensics/hindsight/blob/master/LICENSE.md)
# Notes:
# Version: v2021.12

{% set version = 'v2021.12' %}
{% set files = [('hindsight.exe', '6F0F768CE21F7948BFC676AAA66D85E6D45945D0CB9E0844C160C8C9FF0D988C'),
                ('hindsight_gui.exe', 'E9B1D2639929D0E112A02932B36E84D61A7852C331D6BCCE12C798CD5422B69B')] %}

{% for file, hash in files %}
hindsight-download-{{ file }}:
  file.managed:
    - name: 'C:\standalone\hindsight\{{ file }}'
    - source: https://github.com/obsidianforensics/hindsight/releases/download/{{ version }}/{{ file }}
    - source_hash: sha256={{ hash }}
    - makedirs: True
    - replace: True
{% endfor %}

hindsight-path:
  win_path.exists:
    - name: 'C:\standalone\hindsight\'
