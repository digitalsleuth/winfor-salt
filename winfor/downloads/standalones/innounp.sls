# Name: Innounp
# Website: https://innounp.sourceforge.net
# Description: Unpacker of executables packed by InnoSetup
# Category: Installers
# Author: Ariman_ua, quickener
# License: GNU General Public License v3 (https://innounp.sourceforge.net/#Copyrights)
# Version: 0.50
# Notes: 

{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

innounp-download-only:
  file.managed:
    - name: '{{ downloads }}\innounp050.rar'
    - source: 'https://versaweb.dl.sourceforge.net/project/innounp/innounp/innounp%200.50/innounp050.rar'
    - source_hash: sha256=1d8837540ccc15d98245a1c73fd08f404b2a7bdfe7dc9bed2fdece818ff6df67
    - makedirs: True

