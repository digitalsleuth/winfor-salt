# Name: IDA Free
# Website: https://hex-rays.com/ida-free
# Description: Binary analysis tool for x86/x64 applications
# Category: Executables
# Author: hex-rays
# License: Free for Educational, Personal, and non-Commercial use
# Version: 8.3
# Notes: 

{% set version = '8.3' %}

ida-free:
  pkg.installed

ida-remove-shortcut:
  file.absent:
    - name: 'C:\Users\Public\Desktop\IDA Freeware {{ version }}.lnk'
    - require:
      - pkg: ida-free
    - watch:
      - pkg: ida-free
