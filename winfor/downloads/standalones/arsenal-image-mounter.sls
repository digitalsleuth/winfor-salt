# Name: Arsenal Image Mounter
# Website: https://arsenalrecon.com
# Description: Forensic Image Mounter
# Category: Acquisition and Analysis
# Author: Arsenal Recon
# License: https://github.com/ArsenalRecon/Arsenal-Image-Mounter/blob/master/LICENSE.md
# Version: 3.10.262
# Notes:

{% set hash = '672baab821323fc17670846c3af281d74fb3ce80ce4718b1eccece633e69bc17' %}
{% set version = '3.10.262' %}
{% set file_value = 'i8xSTZQI#jq1L2HG-y2jWzRcK_cFnUk78e4ZRO4jyRcjC7BKIDjw' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

include:
  - winfor.downloads.standalones.megatools

arsenal-folder:
  file.directory:
    - name: '{{ downloads }}\arsenal-image-mounter'
    - win_inheritance: True

arsenal-download-only:
  cmd.run:
    - name: '{{ downloads }}\megatools\megatools\megatools.exe dl https://mega.nz/file/{{ file_value }} --path {{ downloads }}\arsenal-image-mounter\'
    - shell: cmd
    - require:
      - sls: winfor.downloads.standalones.megatools
      - file: arsenal-folder
