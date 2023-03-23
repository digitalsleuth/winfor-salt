# Name: PPEE (puppy)
# Website: https://www.mzrst.com/
# Description: Professional PE file Explorer
# Category: Executables
# Author: Zaderostam
# License: 
# Version: 1.12
# Notes: 

{% set version = '1.12' %}
{% set hash = '9ee99220fe876527aaeec93d9b2c944e64d9c3c9d18ac3e3a52afd4a7392da88' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

ppee-download-only:
  file.managed:
    - name: '{{ downloads }}\PPEE(puppy)_{{ version }}.zip'
    - source: 'https://www.mzrst.com/puppy/PPEE(puppy)%20{{ version }}.zip'
    - source_hash: sha256={{ hash }}
    - makedirs: True
