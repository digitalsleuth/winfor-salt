# Name: regshot
# Website: https://sourceforge.net/projects/regshot/
# Description: Registry snapshot utility to compare snapshots
# Category: Registry
# Author: maddes, regshot, xhmikosr
# License: GNU Lesser General Public License (https://sourceforge.net/p/regshot/code/HEAD/tree/branches/1.9.0/files/license_lgpl-2.1.txt)
# Version: 1.9.0
# Notes: 

{% set version = '1.9.1-beta_r321' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set hash = '5933d59f591e1e68ce7819904f8cb1118fc935bdfe89581599d0560ec9b97cd6' %}

regshot-download-only:
  file.managed:
    - name: '{{ downloads }}\regshot\Regshot-{{ version }}.7z'
    - source: https://cytranet-dal.dl.sourceforge.net/project/regshot/regshot/{{ version.split("_")[0] }}/Regshot-{{ version }}.7z
    - source_hash: sha256={{ hash }}
    - makedirs: True
