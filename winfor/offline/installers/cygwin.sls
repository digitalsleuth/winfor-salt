# Name: Cygwin
# Website: https://cygwin.com
# Description: Linux Terminal Emulator for Windows
# Category: Terminals
# Author: https://cygwin.com/faq.html#faq.what.who
# License: GNU General Public License (GPL) (https://cygwin.com/licensing.html)
# Version: 3.6.6
# Notes: Retcode below is set to '2' for success because the Cygwin installer (even though on Windows) attempts to search for /etc/setup/setup.rc or /etc/setup/installed.db and fails with retcode 2. This causes Saltstack to read an ERROR and result: False, even though the pkg state returns 'install success'.

{% set version = '3.6.6' %}
{% set downloads = salt['pillar.get']('offline', 'C:\winfor-downloads') %}
{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set pkg = 'cygwin-'~ version ~'.exe' %}
{% set exists = salt['file.file_exists'](downloads + '\\cygwin\\' + pkg) %}

{% if exists %}

cygwin-install-offline:
  file.rename:
    - name: '{{ inpath }}\cygwin'
    - source: '{{ downloads }}\cygwin\'
    - force: True
    - makedirs: True

cygwin-env-vars-offline:
  win_path.exists:
    - name: '{{ inpath }}\cygwin\'
    - require:
      - file: cygwin-install-offline

{% else %}
{{ pkg }} does not exist - not installing:
  test.nop
{% endif %}
