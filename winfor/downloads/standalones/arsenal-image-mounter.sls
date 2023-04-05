# Name: Arsenal Image Mounter
# Website: https://arsenalrecon.com
# Description: Forensic Image Mounter
# Category: Acquisition and Analysis
# Author: Arsenal Recon
# License: https://github.com/ArsenalRecon/Arsenal-Image-Mounter/blob/master/LICENSE.md
# Version: 3.9.239
# Notes:

{% set hash = '78CCCBDB73354C2F6F9417DC7E33578ADBA5970643B125EB4DBCFF19171A1F74' %}
{% set version = '3.9.239' %}
{% set file_value = 'T1gBDIhZ#lbOrVwmPx8OF0rwCEFieNFnGiwycdcahwFVbvtiRI_A' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

include:
  - winfor.downloads.standalones.megatools

arsenal-download-only:
  cmd.run:
    - name: '{{ downloads }}\megatools\megatools.exe dl https://mega.nz/file/{{ file_value }} --path {{ downloads }}'
    - shell: cmd
    - require:
      - sls: winfor.downloads.standalones.megatools
