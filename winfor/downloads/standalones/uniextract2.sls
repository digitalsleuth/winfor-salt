# Name: UniExtract2
# Website: https://github.com/Bioruebe/UniExtract2
# Description: Tool to extract files from installers
# Category: Installers
# Author: William Engelmann
# License: GNU General Public License v2 (https://github.com/Bioruebe/UniExtract2/blob/master/LICENSE)
# Version: 2.0.0-rc.3
# Notes: 

{% set version = '2.0.0-rc.3' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% from 'winfor/_macros/hashes.jinja' import get_hash %}
{% set hash = get_hash('uniextract2') %}

uniextract2-download-only:
  file.managed:
    - name: '{{ downloads }}\uniextract2\uniextract2-{{ version }}.zip'
    - source: https://github.com/Bioruebe/UniExtract2/releases/download/v{{ version }}/UniExtractRC3.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True
