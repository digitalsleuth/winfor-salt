# Name: Entropy
# Website: https://github.com/merces/entropy
# Description: Command-line tool to calculate entropy of a file
# Category: Utilities
# Author: Fernando Merces
# License: GNU General Public License v2.0 (https://github.com/merces/entropy/blob/master/LICENSE)
# Version: 1.1
# Notes:

{% set version = '1.1' %}
{% set hash = '78971932f891f970aefcf483cdaa6aa5769b4a6083df8eccb3218f5a3aa6590c' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

entropy-download-only:
  file.managed:
    - name: '{{ downloads }}\entropy\entropy-{{ version }}-win64.zip'
    - source: https://github.com/merces/entropy/releases/download/v{{ version }}/entropy-{{ version }}-win64.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True
