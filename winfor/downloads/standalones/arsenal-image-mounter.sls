# Name: Arsenal Image Mounter
# Website: https://arsenalrecon.com
# Description: Forensic Image Mounter
# Category: Acquisition and Analysis
# Author: Arsenal Recon
# License: https://github.com/ArsenalRecon/Arsenal-Image-Mounter/blob/master/LICENSE.md
# Version: 3.10.257
# Notes:

{% set hash = '104b6b743ca4dcd3d2b67cf472bce7b365aff4c6af6d81fe9c95ab09619d0004' %}
{% set version = '3.10.257' %}
{% set file_value = 'rg5CXJoK#-rUdbyr1NQll0UrkVAIOQ5km8hD4qMwFIWat4U0OR60' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

include:
  - winfor.downloads.standalones.megatools

arsenal-download-only:
  cmd.run:
    - name: '{{ downloads }}\megatools\megatools.exe dl https://mega.nz/file/{{ file_value }} --path {{ downloads }}'
    - shell: cmd
    - require:
      - sls: winfor.downloads.standalones.megatools
