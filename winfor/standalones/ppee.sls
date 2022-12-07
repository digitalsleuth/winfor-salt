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
{% set PROGRAMDATA = salt['environ.get']('PROGRAMDATA') %}

ppee-download:
  file.managed:
    - name: 'C:\salt\tempdownload\PPEE(puppy)_{{ version }}.zip'
    - source: 'https://www.mzrst.com/puppy/PPEE(puppy)%20{{ version }}.zip'
    - source_hash: sha256={{ hash }}
    - makedirs: True

ppee-extract:
  archive.extracted:
    - name: 'C:\standalone\'
    - source: 'C:\salt\tempdownload\PPEE(puppy)_{{ version }}.zip'
    - enforce_toplevel: False
    - require:
      - file: ppee-download

ppee-folder-rename:
  file.rename:
    - name: 'C:\standalone\ppee'
    - source: 'C:\standalone\PPEE(puppy) {{ version }}\'
    - force: True
    - makedirs: True
    - require:
      - archive: ppee-extract

winfor-standalones-ppee-shortcut:
  file.shortcut:
    - name: '{{ PROGRAMDATA }}\Microsoft\Windows\Start Menu\Programs\PPEE.lnk'
    - target: 'C:\standalone\ppee\PPEE.exe'
    - force: True
    - working_dir: 'C:\standalone\ppee\'
    - makedirs: True
    - require:
      - file: ppee-download
      - archive: ppee-extract
