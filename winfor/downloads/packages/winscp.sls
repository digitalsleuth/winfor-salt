# Name: WinSCP
# Website: https://winscp.net/
# Description: Windows SFTP and SCP Client
# Category: Network
# Author: Martin Prikryl
# License: GNU General Public License v3 (https://github.com/winscp/winscp/blob/master/license.txt)
# Version: 6.5.3
# Notes:

{% set version = '6.5.3' %}
{% set hash = '66de37a79900c3eebc8225058cae5e2db3df939308ba6b2d518b39c98e4f41da' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

winscp-download-only:
  file.managed:
    - name: '{{ downloads }}\winscp\WinSCP-{{ version }}-Setup.exe'
    - source: https://downloads.sourceforge.net/project/winscp/WinSCP/{{ version }}/WinSCP-{{ version }}-Setup.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True

