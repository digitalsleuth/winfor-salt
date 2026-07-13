# Name: Email Header Analyzer
# Website: https://github.com/cyberdefenders/email-header-analyzer
# Description: Python-based Email Header Analysis Tool
# Category: Email
# Author: Ahmed Shawky (lnxg33k)
# License: GNU General Public License v3.0 (https://github.com/cyberdefenders/email-header-analyzer/blob/master/LICENSE.md)
# Version: v1
# Notes:

{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set PROGRAMDATA = salt['environ.get']('PROGRAMDATA') %}
{% set hash = '24115269f987367db585cfa993b946428402bec016a0821cc6c08ae20f0dc61a' %}

include:
  - winfor.standalones.portable-python3

email-header-analyzer-download-only:
  file.managed:
    - name: '{{ downloads }}\email-header-analyzer.zip'
    - source: https://github.com/cyberdefenders/email-header-analyzer/archive/refs/heads/master.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True

email-header-analyzer-extract-download-only:
  archive.extracted:
    - name: '{{ downloads }}\'
    - source: '{{ downloads }}\email-header-analyzer.zip'
    - enforce_toplevel: False
    - require:
      - file: email-header-analyzer-download-only

email-header-analyzer-folder-rename-download-only:
  file.rename:
    - name: '{{ downloads }}\email-header-analyzer'
    - source: '{{ downloads }}\email-header-analyzer-master'
    - force: True
    - makedirs: True
    - require:
      - archive: email-header-analyzer-extract-download-only

email-header-analyzer-requirements-download-only:
  cmd.run:
    - name: '{{ inpath }}\portable-python3\python.exe -m pip download -r requirements.txt -d packages'
    - cwd: '{{ downloads }}\email-header-analyzer'
    - require:
      - file: email-header-analyzer-folder-rename-download-only
      - sls: winfor.standalones.portable-python3

email-header-analyzer-remove-download-only:
  file.absent:
    - name: '{{ downloads }}\email-header-analyzer.zip'
    - require:
      - cmd: email-header-analyzer-requirements-download-only

