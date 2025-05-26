# Name: Cygwin
# Website: https://cygwin.com
# Description: Linux Terminal Emulator for Windows
# Category: Terminals
# Author: https://cygwin.com/faq.html#faq.what.who
# License: GNU General Public License (GPL) (https://cygwin.com/licensing.html)
# Version: 3.6.1
# Notes: Retcode below is set to '2' for success because the Cygwin installer (even though on Windows) attempts to search for /etc/setup/setup.rc or /etc/setup/installed.db and fails with retcode 2. This causes Saltstack to read an ERROR and result: False, even though the pkg state returns 'install success'.

{% set hash = '46993d76d756bde18564f72a4ee07384cd82b447527ca406c8bfc034cb05c664' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set version = '3.6.1' %}

cygwin-download-only:
  file.managed:
    - name: '{{ downloads }}\cygwin\setup-x86_64-{{ version }}.exe'
    - source: https://cygwin.com/setup-x86_64.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True
