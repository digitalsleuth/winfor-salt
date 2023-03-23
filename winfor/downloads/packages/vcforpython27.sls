# Name: Microsoft Visual C++ Compiler for Python 2.7
# Website: https://visualstudio.microsoft.com/visual-cpp-build-tools/
# Description: Compiler for Python 2.7 to compile scripts on Windows
# Category: Requirements
# Author: Microsoft
# License: EULA
# Version: 9.0.1.30729
# Notes:

{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set version = '9.0.1.30729' %}
{% set hash = '070474db76a2e625513a5835df4595df9324d820f9cc97eab2a596dcbc2f5cbf' %}

vcforpython27-download-only:
  file.managed:
    - name: '{{ downloads }}\VCForPython27.msi'
    - source: https://github.com/digitalsleuth/salt-winrepo-ng/raw/main/files/VCForPython27.msi
    - source_hash: sha256={{ hash }}
    - makedirs: True
