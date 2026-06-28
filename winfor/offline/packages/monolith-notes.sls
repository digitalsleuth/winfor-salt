# Name: Monolith Notes
# Website: https://www.monolithforensics.com/
# Description: Forensic note taking and tracking tool
# Category: Utilities
# Author: Monolith Forensics
# License: EULA
# Version: 2.0.2
# Notes:

{% set version = '2.0.2' %}
{% set downloads = salt['pillar.get']('offline', 'C:\winfor-downloads') %}
{% set pkg = 'monolith-notes-'~ version ~'.exe' %}
{% set exists = salt['file.file_exists'](downloads + '\\monolith-notes\\' + pkg) %}
{% set PROGRAM_FILES = "%ProgramFiles%" %}
{% set user = salt['pillar.get']('winfor_user', 'forensics') %}
{% set current_user = salt['environ.get']('USERNAME') %}
{% set all_users = salt['user.list_users']() %}
{% if user in all_users %}
  {% set home = salt['user.info'](user).home %}
{% else %}
{% set home = "C:\\Users\\" + user %}
{% endif %}

{% if exists %}
include:
  - winfor.config.user

monolith-notes-install-offline:
  cmd.run:
    - name: '{{ pkg }} /S /D="{{ PROGRAM_FILES }}\Monolith Notes"'
    - shell: cmd
    - cwd: '{{ downloads }}\monolith-notes\'

monolith-remove-desktop-shortcut-offline:
  file.absent:
    - names:
      - '{{ home }}\Desktop\Monolith Notes.lnk'
    {% if user != current_user %}
      - 'C:\Users\{{ current_user }}\Desktop\Monolith Notes.lnk'
    {% endif %}
    - require:
      - cmd: monolith-notes-install-offline
      - user: user-{{ user }}
{% else %}
{{ pkg }} does not exist - not installing:
  test.nop
{% endif %}
