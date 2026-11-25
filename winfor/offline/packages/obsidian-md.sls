# Name: Obsidian
# Website: https://obsidian.md/
# Description: Note taking application
# Category: Utilities
# Author: Obsidian
# License: Free Use (https://obsidian.md/license)
# Version: 1.15.1
# Notes:

# renovate: datasource=github-releases depName=sleuthkit/autopsy
{% set version = '1.15.1' %}
{% set downloads = salt['pillar.get']('offline', 'C:\winfor-downloads') %}
{% set pkg = 'obsidian-md-'~ version ~'.exe' %}
{% set exists = salt['file.file_exists'](downloads + '\\obsidian-md\\' + pkg) %}

{% if exists %}
obsidian-md-install-offline:
  cmd.run:
    - name: '{{ pkg }} /S /ALLUSERS'
    - shell: cmd
    - cwd: '{{ downloads }}\obsidian-md'

obsidian-icon-remove-offline:
  file.absent:
    - name: 'C:\Users\Public\Desktop\Obsidian.lnk'
    - require:
      - cmd: obsidian-install-offline

{% else %}
{{ pkg }} does not exist - not installing:
  test.nop
{% endif %}
