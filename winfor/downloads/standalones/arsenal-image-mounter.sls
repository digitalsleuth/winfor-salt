# Name: Arsenal Image Mounter
# Website: https://arsenalrecon.com
# Description: Forensic Image Mounter
# Category: Acquisition and Analysis
# Author: Arsenal Recon
# License: https://github.com/ArsenalRecon/Arsenal-Image-Mounter/blob/master/LICENSE.md
# Version: 3.12.331
# Notes:

{% set hash = '5827f7ad3b8b9d83c5e6bafecdda73d58e61b75363096792c9e490d029be497b' %}
{% set version = '3.12.331' %}
{% set file_value = 'zkxRCYjL#vbHEgZdFtLoIYNVvZNBID3cp642YOJO5SXH5atMhQ4I' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set arsenal_zip = downloads + '\\arsenal-image-mounter\\Arsenal-Image-Mounter-v' + version + '.zip' %}

include:
  - winfor.downloads.standalones.megatools

arsenal-folder:
  file.directory:
    - name: '{{ downloads }}\arsenal-image-mounter'
    - win_inheritance: True
    - makedirs: True

{% if salt['file.file_exists'](arsenal_zip) and salt['file.check_hash'](arsenal_zip, hash) %}
arsenal-already-exists:
  test.nop

{% else %}
arsenal-download-only:
  cmd.run:
    - name: '{{ downloads }}\megatools\megatools\megatools.exe dl https://mega.nz/file/{{ file_value }} --path {{ downloads }}\arsenal-image-mounter\'
    - shell: cmd
    - require:
      - sls: winfor.downloads.standalones.megatools
      - file: arsenal-folder
{% endif %}
