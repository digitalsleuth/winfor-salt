# Name: Glossary Generator
# Website: (nil - in house tool)
# Description: Tool to generate a glossary for forensic reports
# Category: Utilities
# Author: Jad Saliba
# License: None Provided
# Version: 1.1
# Notes:

{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

glossary-generator-download-only:
  file.managed:
    - name: '{{ downloads }}\gg.zip'
    - source: salt://winfor/files/gg.zip
    - skip_verify: True
    - makedirs: True
