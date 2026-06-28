# Name: Nuix Evidence Mover
# Website: https://www.nuix.com/nuix-evidence-mover
# Description: File Transfer tool with source and destination hashing
# Category: Utilities
# Author: NUIX
# License: https://www.oracle.com/legal/terms.html
# Version: 6.2.1
# Notes:

{% set version = '6.2.1' %}
{% set downloads = salt['pillar.get']('offline', 'C:\winfor-downloads') %}
{% set pkg = 'nuix-evidence-mover-'~ version ~'.msi' %}
{% set exists = salt['file.file_exists'](downloads + '\\nuix\\' + pkg) %}

{% if exists %}
nuix-evidence-mover-install-offline:
  cmd.run:
    - name: 'msiexec /i {{ pkg }} /qn /norestart'
    - shell: cmd
    - cwd: '{{ downloads }}\nuix\'

nuix-evidence-mover-icon-remove-offline:
  file.absent:
    - name: 'C:\Users\Public\Desktop\Nuix Evidence Mover.lnk'
    - require:
      - cmd: nuix-evidence-mover-install-offline

{% else %}
{{ pkg }} does not exist - not installing:
  test.nop
{% endif %}
