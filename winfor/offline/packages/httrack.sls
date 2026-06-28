# Name: HTTrack (for Windows)
# Website: https://www.httrack.com
# Description: Website Copier
# Category: Network
# Author: Xavier Roche and other contributors
# License: GNU General Public License v3 (https://www.httrack.com/page/5/en/index.html)
# Version: 3.49.2
# Notes: WinHTTrack is the Windows release of HTTrack

{% set version = '3.49.2' %}
{% set downloads = salt['pillar.get']('offline', 'C:\winfor-downloads') %}
{% set pkg = 'httrack-'~ version ~'.exe' %}
{% set exists = salt['file.file_exists'](downloads + '\\httrack\\' + pkg) %}

{% if exists %}
httrack-install-offline:
  cmd.run:
    - name: '{{ pkg }} /SP- /ALLUSERS /VERYSILENT /SUPPRESSMSGBOXES /NORESTART /MERGETASKS=!DESKTOPICON,!RUNCODE'
    - shell: cmd
    - cwd: '{{ downloads }}\httrack\'

{% else %}
{{ pkg }} does not exist - not installing:
  test.nop
{% endif %}
