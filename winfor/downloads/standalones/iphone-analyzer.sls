# Name: iphoneanalyzer (iPhone Analyzer)
# Website: https://sourceforge.net/project/iphoneanalyzer/
# Description: Analyze iPhone backups
# Category: Mobile Analysis
# Author: leocrawford, matproud
# License: GNU General Public License v3 (https://sourceforge.net/directory/os:linux/license:gplv3/)
# Version: 2.1.0
# Notes: 

{% set hash = '6499C78336ED937D24A0D1046B369C5847B84A0B06CA9561210E834A85BCB44A' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

iphone-analyzer-download-only:
  file.managed:
    - name: '{{ downloads }}\iphoneanalyzer\iphoneanalyzer.fat.gui-2.1.0.jar'
    - source: "https://deac-fra.dl.sourceforge.net/project/iphoneanalyzer/executable%20jar%20builds/iphoneanalyzer.fat.gui-2.1.0.jar"
    - source_hash: sha256={{ hash }}
    - makedirs: True
