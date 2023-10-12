# Name: UniExtract2
# Website: https://github.com/Bioruebe/UniExtract2
# Description: Tool to extract files from installers
# Category: Installers
# Author: William Engelmann
# License: GNU General Public License v2 (https://github.com/Bioruebe/UniExtract2/blob/master/LICENSE)
# Version: 2.0.0-rc3
# Notes: 

{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set version = '2.0.0-rc.3' %}
{% set hash = '03170680b80f2afdf824f4d700c11b8e2dac805a4d9bd3d24f53e43bd7131c3a' %}

uniextract2-download-only:
  file.managed:
    - name: '{{ downloads }}\uniextract2\UniExtractRC3-{{ version }}.zip'
    - source: https://github.com/Bioruebe/UniExtract2/releases/download/v{{ version }}/UniExtractRC3.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True
