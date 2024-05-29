# Name: KsDumper 11
# Website: https://github.com/mastercodeon314/KsDumper-11
# Description: Kernel Space Dumper utility
# Category: Executables
# Author: mastercodeon314
# License: None at this time
# Version: 1.0
# Notes:

{% set PROGRAMDATA = salt['environ.get']('PROGRAMDATA') %}
{% set defender_status = salt['cmd.run']('powershell -c "(Get-Service windefend).Status"') %}

include:
  - winfor.repos

ksdumper11-defender-exclusion:
  cmd.run:
{% if defender_status == "Running" %}
    - names:
      - 'echo "Defender is {{ defender_status }}"'
      - 'Add-MpPreference -ExclusionPath "C:\Program Files\KsDumper11"'
      - 'Add-MpPreference -ExclusionPath "{{ PROGRAMDATA }}\Salt Project\Salt\var"'
{% else %}
    - name:
      - 'echo "Defender is {{ defender_status }}"'
{% endif %}
    - shell: powershell

ksdumper11:
  pkg.installed:
    - require:
      - cmd: ksdumper11-defender-exclusion

ksdumper11-shortcut:
  file.shortcut:
    - name: '{{ PROGRAMDATA }}\Microsoft\Windows\Start Menu\Programs\KsDumper11.lnk'
    - target: 'C:\Program Files\KsDumper11\KsDumper11.exe'
    - force: True
    - working_dir: 'C:\Program Files\KsDumper11'
    - makedirs: True
    - require:
      - pkg: ksdumper11
