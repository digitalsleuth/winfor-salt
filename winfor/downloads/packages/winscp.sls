# Name: WinSCP
# Website: https://winscp.net/
# Description: Windows SFTP and SCP Client
# Category: Network
# Author: Martin Prikryl
# License: GNU General Public License v3 (https://github.com/winscp/winscp/blob/master/license.txt)
# Version: 6.1.1
# Notes:

{% set version = '6.1.1' %}
{% set hash = '81244062a2de4adc52ae10393b7a3a33985a7e5bea376b839ab0477d6c7fd5e1' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

winscp-download-only:
  file.managed:
    - name: '{{ downloads }}\WinSCP-{{ version }}-Setup.exe'
    - source: https://downloads.sourceforge.net/project/winscp/WinSCP/{{ version }}/WinSCP-{{ version }}-Setup.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True

