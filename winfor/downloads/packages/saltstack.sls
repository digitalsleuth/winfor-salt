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
{% set hash = '9d46f907cb744ec5c02bb0ee6ec79e9e7d8460b4d29cbe898c34610f747a3f43' %}

saltstack-download-only:
  file.managed:
    - name: '{{ downloads }}\saltstack\{{ file }}'
    - source: https://packages.broadcom.com/artifactory/saltproject-generic/windows/{{ version }}/{{ file }}
    - source_hash: sha256={{ hash }}
    - makedirs: True
