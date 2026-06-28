# Name: Passware Encryption Analyzer
# Website: https://www.passware.com
# Description: Encryption Analysis tool
# Category: Raw Parsers / Decoders
# Author: Passware - Dmitry Sumin
# License: EULA - https://www.passware.com/files/Passware-EULA.pdf
# Version: 2026.2.0.5145
# Notes:

{% set version = '2026.2.0.5145' %}
{% set downloads = salt['pillar.get']('offline', 'C:\winfor-downloads') %}
{% set pkg = 'passware-encryption-analyzer-'~ version ~'.msi' %}
{% set exists = salt['file.file_exists'](downloads + '\\passware-encryption-analyzer\\' + pkg) %}

{% if exists %}
passware-encryption-analyzer-install-offline:
  cmd.run:
    - name: 'msiexec /i {{ pkg }} DESKTOP_SHORTCUT="" /qn /norestart'
    - shell: cmd
    - cwd: '{{ downloads }}\passware-encryption-analyzer\'

{% else %}
{{ pkg }} does not exist - not installing:
  test.nop
{% endif %}
