# Name: ZAPiXDESK
# Website: https://github.com/kraftdenker/ZAPiXDESK
# Description: PowerShell script for acquiring and decrypting WhatsApp Desktop
# Category: Acquisition and Analysis
# Author: Alberto Magno and Corey Forman (digitalsleuth)
# License: GNU General Public License v3.0 (https://github.com/kraftdenker/ZAPiXDESK/blob/main/LICENSE)
# Version: 2.0
# Notes:

{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}

include:
  - winfor.packages.git

zapixdesk-git:
  git.latest:
    - name: https://github.com/kraftdenker/ZAPiXDESK.git
    - target: '{{ inpath }}\zapixdesk'
    - rev: main
    - force_clone: True
    - force_reset: True
    - require:
      - sls: winfor.packages.git
