# Name: MagnetProcessCapture
# Website: https://magnetforensics.com
# Description: Tool to dump a running process
# Category: Executables
# Author: Magnet Forensics
# License: EULA
# Version: v13
# Notes:

{% set hash = '8525f97a51c30c25c897c9abe9d1dbea81919cf538582ae31f40825ef2be4e10' %}
{% set version = 'V13' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

magnet-process-capture-download-only:
  file.managed:
    - name: '{{ downloads }}\magnetforensics\MagnetProcessCapture{{ version }}.zip'
    - source: https://storage.googleapis.com/mfi-files/free_tools/MagnetProcessCapture/MagnetProcessCapture{{ version }}.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True

