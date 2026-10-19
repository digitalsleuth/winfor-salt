# Name: Innounp
# Website: https://innounp.sourceforge.net
# Description: Unpacker of executables packed by InnoSetup
# Category: Installers
# Author: Ariman_ua, quickener
# License: GNU General Public License v3 (https://innounp.sourceforge.net/#Copyrights)
# Version: 0.50
# Notes: 

{% set version = '0.50' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% from 'winfor/_macros/hashes.jinja' import get_hash %}
{% set hash = get_hash('innounp') %}

innounp-download-only:
  file.managed:
    - name: '{{ downloads }}\innounp\innounp-{{ version }}.rar'
    - source: 'https://downloads.sourceforge.net/project/innounp/innounp/innounp%200.50/innounp050.rar'
    - source_hash: sha256={{ hash }}
    - makedirs: True

