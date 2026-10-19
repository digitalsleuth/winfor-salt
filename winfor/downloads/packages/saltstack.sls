# Name: SaltStack
# Website: https://saltproject.io
# Description: Automation Software
# Category: Utilities
# Author: VMware, Inc
# License: Apache License 2.0 (https://github.com/saltstack/salt/blob/master/LICENSE)
# Version: 3007.2
# Notes:

{% set version = '3007.2' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set file = 'Salt-Minion-' ~ version ~ '-Py3-AMD64-Setup.exe' %}
{% from 'winfor/_macros/hashes.jinja' import get_hash %}
{% set hash = get_hash('saltstack') %}

saltstack-download-only:
  file.managed:
    - name: '{{ downloads }}\saltstack\saltstack-{{ version }}.exe'
    - source: https://packages.broadcom.com/artifactory/saltproject-generic/windows/{{ version }}/{{ file }}
    - source_hash: sha256={{ hash }}
    - makedirs: True
