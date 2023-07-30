# Name: Cygwin
# Website: https://cygwin.com
# Description: Linux Terminal Emulator for Windows
# Category: Terminals
# Author: https://cygwin.com/faq.html#faq.what.who
# License: GNU General Public License (GPL) (https://cygwin.com/licensing.html)
# Version: 3.4.7
# Notes: Retcode below is set to '2' for success because the Cygwin installer (even though on Windows) attempts to search for /etc/setup/setup.rc or /etc/setup/installed.db and fails with retcode 2. This causes Saltstack to read an ERROR and result: False, even though the pkg state returns 'install success'.

{% set hash = 'a17217e66dd7c40fa4851a433335c1f3f003cd627116c708b2f6e66eba886ea9' %}

cygwin:
  file.managed:
    - name: 'C:\salt\tempdownload\setup-x86_64.exe'
    - source: https://cygwin.com/setup-x86_64.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True

cygwin-install:
  cmd.run:
    - name: 'C:\salt\tempdownload\setup-x86_64.exe -R C:\cygwin64\ -d -X -l C:\cygwin64\ -q -O -s https://mirror.csclub.uwaterloo.ca/cygwin/'
    - shell: cmd
    - success_retcodes: 2
