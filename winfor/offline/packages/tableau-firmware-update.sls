# Name: Tableau Firmware Update
# Website: https://www.opentext.com
# Description: Firmware update utility for Tableau forensic devices
# Category: Utilities
# Author: OpenText
# License: EULA
# Version: 25.4.17
# Notes: 

{% set version = '25.4' %}
{% set downloads = salt['pillar.get']('offline', 'C:\winfor-downloads') %}
{% set pkg = 'tableau-firmware-update-'~ version ~'.msi' %}
{% set exists = salt['file.file_exists'](downloads + '\\tableau\\' + pkg) %}
{% set PROGRAMDATA = salt['environ.get']('PROGRAMDATA') %}
{% set user = salt['pillar.get']('winfor_user', 'forensics') %}
{% set current_user = salt['environ.get']('USERNAME') %}
{% set all_users = salt['user.list_users']() %}
{% if user in all_users %}
  {% set home = salt['user.info'](user).home %}
{% else %}
{% set home = "C:\\Users\\" + user %}
{% endif %}

{% if exists %}
include:
  - winfor.config.user

tableau-extract-certificate-offline:
  cmd.run:
    - name: powershell.exe -NonInteractive -Command "(Get-AuthenticodeSignature '{{ downloads }}\tableau\tableau-firmware-update-{{ version }}.msi').SignerCertificate | Export-Certificate -Type CERT -FilePath '{{ downloads }}\tableau\tableau.cer' | Out-Null"
    - cwd: '{{ downloads }}\tableau'

tableau-certificate-install-offline:
  certutil.add_store:
    - name: '{{ downloads }}\tableau\tableau.cer'
    - store: TrustedPublisher
    - require:
      - cmd: tableau-extract-certificate-offline

tableau-firmware-update-install-offline:
  cmd.run:
    - name: 'msiexec /i {{ pkg }} /qn /norestart'
    - shell: cmd
    - cwd: '{{ downloads }}\tableau\'

tableau-firmware-update-icon-del-offline:
  file.absent:
    - names:
      - '{{ home }}\Desktop\Tableau Firmware Update.lnk'
      - 'C:\Users\Public\Desktop\Tableau Firmware Update.lnk'
    {% if user != current_user %}
      - 'C:\Users\{{ current_user }}\Desktop\Tableau Firmware Update.lnk'
    {% endif %}
    - require:
      - certutil: tableau-certificate-install-offline
      - cmd: tableau-firmware-update-install-offline
      - user: user-{{ user }}

tableau-firmware-update-shortcut-offline:
  file.shortcut:
    - name: '{{ PROGRAMDATA }}\Microsoft\Windows\Start Menu\Programs\Tableau Firmware Update.lnk'
    - target: 'C:\Program Files (x86)\Tableau\Tableau Firmware Update\tabup.exe'
    - force: True
    - working_dir: 'C:\Program Files (x86)\Tableau\Tableau Firmware Update\'
    - require:
      - cmd: tableau-firmware-update-install-offline

{% else %}
{{ pkg }} does not exist - not installing:
  test.nop
{% endif %}
