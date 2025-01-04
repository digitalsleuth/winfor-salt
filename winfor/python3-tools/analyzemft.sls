# Name: analyzeMFT
# Website: https://github.com/rowingdude/analyzemft
# Description: Python tool to fully parse the MFT from an NTFS file system
# Category: Windows Analysis
# Author: Benjamin Cance (rowingdude)
# License: MIT License (https://github.com/rowingdude/analyzeMFT/blob/master/LICENSE.txt)
# Version: 3.0.6.6
# Notes:

{% set version = '3.0.6.6' %}
{% set commit = 'b1d0e6a0aa58d42000bfdb8e6588513bd62eaeab' %}

include:
  - winfor.packages.python3

analyzemft-install:
  pip.installed:
    - name: git+https://github.com/rowingdude/analyzemft.git@{{ commit }}
    - bin_env: 'C:\Program Files\Python310\python.exe'
    - upgrade: True
    - require:
      - sls: winfor.packages.python3
