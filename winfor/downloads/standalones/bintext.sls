# Name: Bintext
# Website: https://mcafee.com
# Description: Finds Ascii, Unicode, and Resource strings in a file
# Category: Executables
# Author: Mcafee
# License: Free
# Version: 3.03
# Notes: 

{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

bintext-download-only:
  file.managed:
    - name: '{{ downloads }}\bintext303.zip'
    - source: salt://winfor/files/bintext303.zip
    - source_hash: sha256=eb1f2cdd3b8dea931b2fcc13a6ee4c4daad26826fa7db26f9e4f82e7f7b26743
    - makedirs: True
