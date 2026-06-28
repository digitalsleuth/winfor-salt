# Name: Apple iTunes
# Website: https://www.apple.com
# Description: Media viewer and Apple device manager
# Category: Utilities
# Author: Apple
# License: EULA
# Version: 12.13.7.1
# Notes:

{% set version = '12.13.7.1' %}
{% set downloads = salt['pillar.get']('offline', 'C:\winfor-downloads') %}

itunes-install-offline:
  cmd.run:
    - name: '"{{ downloads }}\itunes\iTunes64Setup-{{ version }}.exe" /quiet /qn ALLUSERS=1 /norestart'
    - shell: cmd
    - success_retcodes: 3010

itunes-remove-icon-offline:
  file.absent:
    - name: 'C:\Users\Public\Desktop\iTunes.lnk'
    - require:
      - cmd: itunes-install-offline
