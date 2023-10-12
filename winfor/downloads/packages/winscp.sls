# Name: WinSCP
# Website: https://winscp.net/
# Description: Windows SFTP and SCP Client
# Category: Network
# Author: Martin Prikryl
# License: GNU General Public License v3 (https://github.com/winscp/winscp/blob/master/license.txt)
# Version: 6.1.2
# Notes:

{% set version = '6.1.2' %}
{% set hash = '36cc31f0ab65b745f25c7e785df9e72d1c8919d35a1d7bd4ce8050c8c068b13c' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

winscp-download-only:
  file.managed:
    - name: '{{ downloads }}\winscp\WinSCP-{{ version }}-Setup.exe'
    - source: https://downloads.sourceforge.net/project/winscp/WinSCP/{{ version }}/WinSCP-{{ version }}-Setup.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True

