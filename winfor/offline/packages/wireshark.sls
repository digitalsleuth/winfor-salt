# Name: Wireshark
# Website: https://www.wireshark.org
# Description: Network packet capture and analysis tool
# Category: Network
# Author: The Wireshark Foundation (https://gitlab.com/wireshark/wireshark/-/blob/master/AUTHORS)
# License: GNU General Public License v2 (https://gitlab.com/wireshark/wireshark/-/blob/master/COPYING)
# Version: 4.6.6
# Notes: 

{% set version = '4.6.6' %}
{% set downloads = salt['pillar.get']('offline', 'C:\winfor-downloads') %}
{% set pkg = 'wireshark-'~ version ~'.exe' %}
{% set exists = salt['file.file_exists'](downloads + '\\wireshark\\' + pkg) %}

{% if exists %}
wireshark-install-offline:
  cmd.run:
    - name: '{{ pkg }} /S /EXTRACOMPONENTS=sshdump,udpdump,ciscodump,androiddump,randpktdump'
    - shell: cmd
    - cwd: '{{ downloads }}\wireshark\'

{% else %}
{{ pkg }} does not exist - not installing:
  test.nop
{% endif %}
