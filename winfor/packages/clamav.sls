# Name: ClamAV
# Website: https://www.clamav.net
# Description: Open Source Antivirus
# Category: Utilities
# Author: Cisco / Talos - https://www.clamav.net/about
# License: GNU General Public License v2.0 (https://github.com/Cisco-Talos/clamav/blob/main/COPYING.txt)
# Version: 1.2.1
# Notes: 

{% set configs = ['freshclam','clamd'] %}

clamav:
  pkg.installed

{% for config in configs %}
clamav-generate-{{ config }}:
  file.copy:
    - name: 'C:\Program Files\ClamAV\{{ config }}.conf'
    - source: 'C:\Program Files\ClamAV\conf_examples\{{ config }}.conf.sample'
    - force: False
    - makedirs: True
    - require:
      - pkg: clamav

clamav-{{ config }}-edit:
  file.replace:
    - name: 'C:\Program Files\ClamAV\{{ config }}.conf'
    - pattern: ^Example
    - repl: ''
    - count: 1
    - require:
      - file: clamav-generate-{{ config }}
      - pkg: clamav

{% endfor %}

clamav-freshclam-run:
  cmd.run:
    - name: 'C:\Program Files\ClamAV\freshclam.exe'
    - shell: cmd
    - require:
      - pkg: clamav
      - file: clamav-generate-freshclam
      - file: clamav-generate-clamd
      - file: clamav-freshclam-edit
      - file: clamav-clamd-edit
