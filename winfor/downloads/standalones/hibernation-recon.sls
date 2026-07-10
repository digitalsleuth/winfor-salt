# Name: Hibernation-Recon
# Website: https://arsenalrecon.com
# Description: Tool to parse a Windows hibernation file
# Category: Windows Analysis
# Author: Arsenal Recon
# License: EULA
# Version: 1.2.3.96
# Notes:

{% set version = '1.2.3.96' %}
{% set hash = 'a7196907adb7a4fa110cab65ced57e4024f1162a051cd7d0dce1abf3cec998b6' %}
{% set file_value = 'S0AShJZC#0bAnvlQOJBZMbtOHfyN_5jrZXcimfImae4zpY6O220w' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set pkg = 'hiber-recon-'~ version ~'.zip' %}
{% set hiber_zip = downloads + '\\hiber-recon\\' + pkg %}

include:
  - winfor.downloads.standalones.megatools

hiber-recon-folder:
  file.directory:
    - name: '{{ downloads }}\hiber-recon'
    - win_inheritance: True
    - makedirs: True

{% if salt['file.file_exists'](hiber_zip) and salt['file.check_hash'](hiber_zip, hash) %}
Hibernation Recon {{ version }} already exists:
  test.nop

{% else %}
hiber-recon-download-only:
  cmd.run:
    - name: '{{ downloads }}\megatools\megatools\megatools.exe dl https://mega.nz/file/{{ file_value }} --path {{ downloads }}\hiber-recon\hiber-recon-{{ version }}.zip'
    - shell: cmd
    - require:
      - sls: winfor.downloads.standalones.megatools
      - file: hiber-recon-folder
{% endif %}
