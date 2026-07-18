# Name: Tableau Firmware Update
# Website: https://www.opentext.com
# Description: Firmware update utility for Tableau forensic devices
# Category: Utilities
# Author: OpenText
# License: EULA
# Version: 25.4.17
# Notes: 

{% set version = '25.4.17' %}
{% set short_ver = '25.4' %}
{% set hash = '90cb1591aa1571426bd29502197fd7fd972d96b95fa18843ad179a660a41c0ab' %}
{% set PROGRAMDATA = salt['environ.get']('PROGRAMDATA') %}
{% set user = salt['pillar.get']('winfor_user', 'forensics') %}
{% set current_user = salt['environ.get']('USERNAME') %}
{% set all_users = salt['user.list_users']() %}
{% if user in all_users %}
  {% set home = salt['user.info'](user).home %}
{% else %}
{% set home = "C:\\Users\\" + user %}
{% endif %}

include:
  - winfor.config.user
  - winfor.repos

tableau-download-msi:
  file.managed:
    - name: 'C:\salt\tempdownload\tableau-firmware-update-{{ short_ver }}.msi'
    - source: 'https://digitalintelligence.com/files/setup_tableau_firmware_update_{{ short_ver }}.msi'
    - source_hash: sha256={{ hash }}
    - makedirs: True

tableau-extract-certificate:
  cmd.run:
    - name: powershell.exe -NonInteractive -Command "(Get-AuthenticodeSignature 'C:\salt\tempdownload\tableau-firmware-update-{{ short_ver }}.msi').SignerCertificate | Export-Certificate -Type CERT -FilePath 'C:\salt\tempdownload\tableau2.cer' | Out-Null"
    - cwd: 'C:\salt\tempdownload'
    - require:
      - file: tableau-download-msi

tableau-certificate-copy:
  file.managed:
    - name: 'C:\salt\tempdownload\tableau.cer'
    - source: salt://winfor/files/tableau.cer
    - makedirs: True

tableau-certificate-install:
  certutil.add_store:
    - name: 'C:\salt\tempdownload\tableau.cer'
    - store: TrustedPublisher
    - require:
      - file: tableau-certificate-copy

tableau-certificate-install-2:
  certutil.add_store:
    - name: 'C:\salt\tempdownload\tableau2.cer'
    - store: TrustedPublisher
    - require:
      - cmd: tableau-extract-certificate

tableau-firmware-update:
  cmd.run:
    - name: 'msiexec /i C:\salt\tempdownload\tableau-firmware-update-{{ short_ver }}.msi /qn /norestart'
    - shell: cmd
    - require:
      - certutil: tableau-certificate-install
      - certutil: tableau-certificate-install-2

tableau-firmware-update-icon-del:
  file.absent:
    - names:
      - '{{ home }}\Desktop\Tableau Firmware Update.lnk'
      - 'C:\Users\Public\Desktop\Tableau Firmware Update.lnk'
    {% if user != current_user %}
      - 'C:\Users\{{ current_user }}\Desktop\Tableau Firmware Update.lnk'
    {% endif %}
    - require:
      - certutil: tableau-certificate-install
      - certutil: tableau-certificate-install-2
      - cmd: tableau-firmware-update
      - user: user-{{ user }}

tableau-firmware-update-shortcut:
  file.shortcut:
    - name: '{{ PROGRAMDATA }}\Microsoft\Windows\Start Menu\Programs\Tableau Firmware Update.lnk'
    - target: 'C:\Program Files (x86)\Tableau\Tableau Firmware Update\tabup.exe'
    - force: True
    - working_dir: 'C:\Program Files (x86)\Tableau\Tableau Firmware Update\'
    - require:
      - cmd: tableau-firmware-update
