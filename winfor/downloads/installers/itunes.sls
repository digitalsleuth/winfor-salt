# Name: Apple iTunes
# Website: https://www.apple.com
# Description: Media viewer and Apple device manager
# Category: Utilities
# Author: Apple
# License: EULA
# Version: 12.13.7.1
# Notes:

{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set version = '12.13.7.1' %}
{% from 'winfor/_macros/hashes.jinja' import get_hash %}
{% set hash = get_hash('itunes') %}
{% set url_path = get_hash('itunes', 'guid') %}

itunes-download-only:
  file.managed:
    - name: '{{ downloads }}\itunes\itunes-{{ version }}.exe'
    - source: https://secure-appldnld.apple.com/itunes12/{{ url_path }}/iTunes64Setup.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True
