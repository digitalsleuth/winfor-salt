# Name: PPEE (puppy)
# Website: https://www.mzrst.com/
# Description: Professional PE file Explorer
# Category: Executables
# Author: Zaderostam
# License: 
# Version: 1.16
# Notes: 

{% set version = '1.16' %}
{% from 'winfor/_macros/hashes.jinja' import get_hash %}
{% set hash = get_hash('ppee') %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

ppee-download-only:
  file.managed:
    - name: '{{ downloads }}\ppee\ppee-{{ version }}.zip'
    - source: https://www.mzrst.com/puppy/PPEE(puppy)%20{{ version }}.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True
