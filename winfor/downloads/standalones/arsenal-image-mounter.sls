# Name: Arsenal Image Mounter
# Website: https://arsenalrecon.com
# Description: Forensic Image Mounter
# Category: Acquisition and Analysis
# Author: Arsenal Recon
# License: https://github.com/ArsenalRecon/Arsenal-Image-Mounter/blob/master/LICENSE.md
# Version: 3.11.293
# Notes:

{% set hash = 'b145cfd4f405fedd4f00bad8e01bcaf046ea072f6af34f462d760ef3a173a4ee' %}
{% set version = '3.11.293' %}
{% set file_value = 'vggDHQgZ#l3bK8U93pgA08pKhPHbI9gUPdIRNlTv1BrdyLb4yhw0' %}
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
