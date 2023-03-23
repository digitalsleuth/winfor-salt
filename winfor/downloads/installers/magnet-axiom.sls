# Name: Magnet AXIOM
# Website: https://www.magnetforensics.com
# Description: Evidence Acquisition and Analysis toolset
# Category: Acquisition and Analysis
# Author: Jad Saliba - Magnet Forensics
# License: EULA
# Version: 6.11.0.34807
# Notes:

{% set dot_version = '6.11.0.34807' %}
{% set file_version = '6110.34807' %}
{% set hash = '55a130bf3290bb77f58160eeabc4e92df3a140894855c4f1e5b0dc11253b4540' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

magnet-axiom-download-only:
  file.managed:
    - name: '{{ downloads }}\AXIOMv{{ file_version }}setup.zip'
    - source: https://prod-releases.magnetforensics.com/axiom/{{ dot_version }}/installer/AXIOMv{{ file_version }}setup.zip
    - source_hash: sha256={{ hash }}
    - makedirs: True
