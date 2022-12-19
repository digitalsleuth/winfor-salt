# Name: iphoneanalyzer (iPhone Analyzer)
# Website: https://sourceforge.net/project/iphoneanalyzer/
# Description: Analyze iPhone backups
# Category: Mobile Analysis
# Author: leocrawford, matproud
# License: GNU General Public License v3 (https://sourceforge.net/directory/os:linux/license:gplv3/)
# Version: 2.1.0
# Notes: 

{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set PROGRAMDATA = salt['environ.get']('PROGRAMDATA') %}
{% set hash = '6499C78336ED937D24A0D1046B369C5847B84A0B06CA9561210E834A85BCB44A' %}

iphone-analyzer-download:
  file.managed:
    - name: '{{ inpath }}\iphone-analyzer\iphoneanalyzer.fat.gui-2.1.0.jar'
    - source: "https://netactuate.dl.sourceforge.net/project/iphoneanalyzer/executable%20jar%20builds/iphoneanalyzer.fat.gui-2.1.0.jar"
    - source_hash: sha256={{ hash }}
    - makedirs: True

iphone-analyzer-shortcut:
  file.shortcut:
    - name: '{{ PROGRAMDATA }}\Microsoft\Windows\Start Menu\Programs\iPhoneAnalyzer.lnk'
    - target: '{{ inpath }}\iphone-analyzer\iphoneanalyzer.fat.gui-2.1.0.jar'
    - force: True
    - working_dir: '{{ inpath }}\iphone-analyzer\'
    - makedirs: True
