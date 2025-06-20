# Name: ZAPiXDESK
# Website: https://github.com/kraftdenker/ZAPiXDESK
# Description: PowerShell script for acquiring and decrypting WhatsApp Desktop
# Category: Acquisition and Analysis
# Author: Alberto Magno and Corey Forman (digitalsleuth)
# License: GNU General Public License v3.0 (https://github.com/kraftdenker/ZAPiXDESK/blob/main/LICENSE)
# Version: 2.0
# Notes:

{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set version = '2.0' %}

include:
  - winfor.packages.git

zapixdesk-git-download-only:
  git.latest:
    - name: https://github.com/kraftdenker/ZAPiXDESK.git
    - target: '{{ downloads }}\zapixdesk-{{ version }}'
    - rev: main
    - force_clone: True
    - force_reset: True
    - require:
      - sls: winfor.packages.git
