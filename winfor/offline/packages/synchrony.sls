# Name: synchrony
# Website: https://github.com/relative/synchrony
# Description: Javascript Cleaner and Deobfuscator
# Category: Raw Parsers / Decoders
# Author: relative
# License: GNU General Public License v3 (https://github.com/relative/synchrony/blob/master/LICENSE.md)
# Version: 2.4.5
# Notes: Requires nodejs to install, command is 'synchrony'

synchrony is not yet available for offline install:
  test.nop
{#
{% set version = '2.4.5' %}
{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set downloads = salt['pillar.get']('offline', 'C:\winfor-downloads') %}
{% set pkg = 'synchrony-'~ version ~'.zip' %}
{% set exists = salt['file.file_exists'](downloads + '\\synchrony\\' + pkg) %}

{% if exists %}
include:
  - winfor.offline.packages.nodejs

synchrony-extract-offline:
  archive.extracted:
    - name: '{{ inpath }}\'
    - source: '{{ downloads }}\synchrony\synchrony-{{ version }}.zip'
    - enforce_toplevel: False

synchrony-rename-offline:
  file.rename:
    - name: '{{ inpath }}\synchrony'
    - source: '{{ inpath }}\synchrony-{{ version }}\'
    - force: True
    - require:
      - archive: synchrony-extract-offline

synchrony-install-offline:
  cmd.run:
    - name: '"C:\Program Files\nodejs\npm.cmd" install --global'
    - shell: cmd
    - cwd: '{{ inpath }}\synchrony\'
    - require:
      - sls: winfor.offline.packages.nodejs
      - archive: synchrony-extract-offline

{% else %}
{{ pkg }} does not exist - not installing:
  test.nop
{% endif %}
#}
