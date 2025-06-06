# Name: PPEE (puppy)
# Website: https://www.mzrst.com/
# Description: Professional PE file Explorer
# Category: Executables
# Author: Zaderostam
# License: 
# Version: 1.13.1
# Notes: 

{% set version = '1.13.1' %}
{% set hash = 'b82a1cd2753bd7986aa260abc5dbfdea1c9ab1de89fbdc929ea456c17e71ce1a' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

ppee-download-only:
  file.managed:
    - name: '{{ downloads }}\ppee\PPEE(puppy)_{{ version }}.zip'
    - source: https://www.mzrst.com/puppy/PPEE(puppy)%20{{ version }}.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True
