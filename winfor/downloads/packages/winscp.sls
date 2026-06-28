# Name: WinSCP
# Website: https://winscp.net/
# Description: Windows SFTP and SCP Client
# Category: Network
# Author: Martin Prikryl
# License: GNU General Public License v3 (https://github.com/winscp/winscp/blob/master/license.txt)
# Version: 6.5.6
# Notes:

{% set version = '6.5.6' %}
{% set hash = '4488c493bafca6af4e7ae54ed39cb71479e65dc192c4d1a471647bf9cb9d6db0' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

winscp-download-only:
  file.managed:
    - name: '{{ downloads }}\winscp\winscp-{{ version }}.exe'
    - source: https://downloads.sourceforge.net/project/winscp/WinSCP/{{ version }}/WinSCP-{{ version }}-Setup.exe
    - source_hash: sha256={{ hash }}
    - makedirs: True

