# Name: MagnetProcessCapture
# Website: https://magnetforensics.com
# Description: Tool to dump a running process
# Category: Executables
# Author: Magnet Forensics
# License: EULA
# Version: 13
# Notes:

{% set version = '13' %}
{% set hash = '8525f97a51c30c25c897c9abe9d1dbea81919cf538582ae31f40825ef2be4e10' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

magnet-process-capture-download-only:
  file.managed:
    - name: '{{ downloads }}\magnetforensics\magnet-process-capture-{{ version }}.zip'
    - source: https://storage.googleapis.com/mfi-files/free_tools/MagnetProcessCapture/MagnetProcessCaptureV{{ version }}.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True

