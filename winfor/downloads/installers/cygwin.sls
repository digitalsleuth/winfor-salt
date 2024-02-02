# Name: Cygwin
# Website: https://cygwin.com
# Description: Linux Terminal Emulator for Windows
# Category: Terminals
# Author: https://cygwin.com/faq.html#faq.what.who
# License: GNU General Public License (GPL) (https://cygwin.com/licensing.html)
# Version: 3.5.0
# Notes: Retcode below is set to '2' for success because the Cygwin installer (even though on Windows) attempts to search for /etc/setup/setup.rc or /etc/setup/installed.db and fails with retcode 2. This causes Saltstack to read an ERROR and result: False, even though the pkg state returns 'install success'.

{% set hash = '0acdba4df3f78d232ce05cb90bf96b5235fa10158e54b7a56f9b8825cace40fb' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set version = '3.5.0' %}

cygwin-download-only:
  file.managed:
    - name: '{{ downloads }}\cygwin\setup-x86_64-{{ version }}.exe'
    - source: https://cygwin.com/setup-x86_64.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True
