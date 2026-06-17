# Name: Forensic Email Collector
# Website: https://metaspike.com
# Description: Local and Remote email acquisition tool
# Category: Email
# Author: Arman Gungor - Metaspike
# License:
# Version: 4.0.346.1211
# Notes:

{% set version = '4.0.346.1211' %}
{% set offline_path = 'C:\winfor-offline' %}

fec-offline-install:
  cmd.run:
    - name: 'msiexec /i {{ offline_path }}\fec\FECSetup_v{{ version }}.msi ACCEPTEULA=1 /qn /norestart'
    - shell: cmd