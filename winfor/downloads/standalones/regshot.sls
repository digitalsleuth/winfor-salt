# Name: regshot
# Website: https://sourceforge.net/projects/regshot/
# Description: Registry snapshot utility to compare snapshots
# Category: Registry
# Author: maddes, regshot, xhmikosr
# License: GNU Lesser General Public License (https://sourceforge.net/p/regshot/code/HEAD/tree/branches/1.9.0/files/license_lgpl-2.1.txt)
# Version: 1.9.1-beta_r321
# Notes: 

{% set version = '1.9.1-beta_r321' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% from 'winfor/_macros/hashes.jinja' import get_hash %}
{% set hash = get_hash('regshot') %}

regshot-download-only:
  file.managed:
    - name: '{{ downloads }}\regshot\regshot-{{ version }}.7z'
    - source: https://cytranet-dal.dl.sourceforge.net/project/regshot/regshot/{{ version.split("_")[0] }}/Regshot-{{ version }}.7z
    - source_hash: sha256={{ hash }}
    - makedirs: True
