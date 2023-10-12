# Name: CAINE (Computer Aided INvestigative Environment)
# Website: https://www.caine-live.net/
# Description: USB bootable forensic environment
# Category: Utilities
# Author: Nanni Bassetti (https://www.caine-live.net/page4/page4.html)
# License: GNU General Public License v2.1+ (https://www.caine-live.net/)
# Version: 12.4
# Notes: 

{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

caine-iso-download-only:
  file.managed:
    - name: '{{ downloads }}\caine\caine12.4.iso'
    - source: https://deb.parrot.sh/direct/parrot/iso/caine/caine12.4.iso
    - source_hash: sha256=fecf7edbe0646946f737c7536bc76407482fc01bddaedcdd1e515be350fc19dd
    - makedirs: True

