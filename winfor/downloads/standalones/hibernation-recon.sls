# Name: Hibernation-Recon
# Website: https://arsenalrecon.com
# Description: Tool to parse a Windows hibernation file
# Category: Windows Analysis
# Author: Arsenal Recon
# License: EULA
# Version: 1.2.2.86
# Notes:

{% set hash = 'de71fb354e5d9a6193c165f18d775819f1277014a7317371cdec14060857f606' %}
{% set version = '1.2.2.86' %}
{% set file_value = 'z4Q2iD4C#1I8eFUnuV-x-OOuFJ7G-8YWcNPDfrV26w3aL2mnqGPI' %}
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
