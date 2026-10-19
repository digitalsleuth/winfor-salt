# Name: Cygwin
# Website: https://cygwin.com
# Description: Linux Terminal Emulator for Windows
# Category: Terminals
# Author: https://cygwin.com/faq.html#faq.what.who
# License: GNU General Public License (GPL) (https://cygwin.com/licensing.html)
# Version: 3.6.6
# Notes: Retcode below is set to '2' for success because the Cygwin installer (even though on Windows) attempts to search for /etc/setup/setup.rc or /etc/setup/installed.db and fails with retcode 2. This causes Saltstack to read an ERROR and result: False, even though the pkg state returns 'install success'.

{% set version = '3.6.6' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% from 'winfor/_macros/hashes.jinja' import get_hash %}
{% set hash = get_hash('cygwin') %}

cygwin-download-only:
  file.managed:
    - name: '{{ downloads }}\cygwin\cygwin-{{ version }}.exe'
    - source: https://cygwin.com/setup-x86_64.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True

cygwin-setup-download-only:
  cmd.run:
    - name: '{{ downloads }}\cygwin\cygwin-{{ version }}.exe -R {{ downloads }}\cygwin\ -d -X -l {{ downloads }}\cygwin\ -q -O -s https://mirrors.cicku.me/cygwin/'
    - shell: cmd
    - success_retcodes: 2
