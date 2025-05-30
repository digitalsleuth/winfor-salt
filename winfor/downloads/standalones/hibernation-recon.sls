# Name: Hibernation-Recon
# Website: https://arsenalrecon.com
# Description: Tool to parse a Windows hibernation file
# Category: Windows Analysis
# Author: Arsenal Recon
# License: EULA
# Version: 1.2.3.87
# Notes:

{% set hash = 'bd76ae4f98908b400c8beaa676b862d953c4aa49853634e663ef1f2ac84069a1' %}
{% set version = '1.2.3.87' %}
{% set file_value = '3kRRxSZA#y98k7mBJKpygPxFu5Txi_-l9iDnyN3GzYxzjTVb3z-I' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set hiber_zip = downloads + '\\hiber-recon\\Hibernation-Recon-v' + version + '.zip' %}

include:
  - winfor.downloads.standalones.megatools

hiber-recon-folder:
  file.directory:
    - name: '{{ downloads }}\hiber-recon'
    - win_inheritance: True
    - makedirs: True

{% if salt['file.file_exists'](hiber_zip) and salt['file.check_hash'](hiber_zip, hash) %}
hiber-recon-already-exists:
  test.nop

{% else %}
hiber-recon-download-only:
  cmd.run:
    - name: '{{ downloads }}\megatools\megatools\megatools.exe dl https://mega.nz/file/{{ file_value }} --path {{ downloads }}\hiber-recon\'
    - shell: cmd
    - require:
      - sls: winfor.downloads.standalones.megatools
      - file: hiber-recon-folder
{% endif %}
