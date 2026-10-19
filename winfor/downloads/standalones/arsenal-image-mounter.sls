# Name: Arsenal Image Mounter
# Website: https://arsenalrecon.com
# Description: Forensic Image Mounter
# Category: Acquisition and Analysis
# Author: Arsenal Recon
# License: https://github.com/ArsenalRecon/Arsenal-Image-Mounter/blob/master/LICENSE.md
# Version: 3.12.344
# Notes:

{% set version = '3.12.344' %}
{% from 'winfor/_macros/hashes.jinja' import get_hash %}
{% set hash = get_hash('arsenal-image-mounter') %}
{% set file_value = get_hash('arsenal-image-mounter', 'file_value') %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set arsenal_zip = downloads + '\\arsenal-image-mounter\\arsenal-image-mounter-' + version + '.zip' %}

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
    - name: '{{ downloads }}\megatools\megatools\megatools.exe dl https://mega.nz/file/{{ file_value }} --path {{ arsenal_zip }}'
    - shell: cmd
    - require:
      - sls: winfor.downloads.standalones.megatools
      - file: arsenal-folder
{% endif %}
