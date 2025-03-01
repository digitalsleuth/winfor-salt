# Name: Arsenal Image Mounter
# Website: https://arsenalrecon.com
# Description: Forensic Image Mounter
# Category: Acquisition and Analysis
# Author: Arsenal Recon
# License: https://github.com/ArsenalRecon/Arsenal-Image-Mounter/blob/master/LICENSE.md
# Version: 3.11.303
# Notes:

{% set hash = '74932b460245abd11defc77cedf5c42d75f94868130be5896f57d57299d8c10c' %}
{% set version = '3.11.303' %}
{% set file_value = 'Tkp3wTbS#InzG_kGAiroixTnq1ji1rDVZxO9736QfxoArUiE5gh4' %}
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
