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

cygwin-install-offline:
  cmd.run:
    - name: '{{ downloads }}\cygwin\setup-x86_64-{{ version }}.exe -R C:\cygwin64\ -d -X -l C:\cygwin64\ -q -O -s https://mirror.csclub.uwaterloo.ca/cygwin/'
    - shell: cmd
    - success_retcodes: 2

cygwin-env-vars-offline:
  win_path.exists:
    - name: 'C:\cygwin64\'
    - require:
      - cmd: cygwin-install-offline
