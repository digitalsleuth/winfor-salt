# Name: 
# Website: 
# Description: 
# Category: 
# Author: 
# License: 
# Notes: 

# Retcode below is set to '2' for success because the Cygwin installer
# (even though on Windows) attempts to search for /etc/setup/setup.rc
# or /etc/setup/installed.db and fails with retcode 2. This causes
# Saltstack to read an ERROR and result: False, even though the pkg state
# returns 'install success'.
#{% set version = '2.912' %}
{% set hash = '18b445dc16259bb772aaf0d32d64f9ed3166045fdc07eb9154651840d8a27752' %}

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
