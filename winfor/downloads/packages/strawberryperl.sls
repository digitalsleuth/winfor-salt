# Name: Strawberry Perl
# Website: https://strawberryperl.com
# Description: Perl programming language environment for Windows
# Category: Requirements
# Author: Strawberry Perl
# License: GNU General Public License 1+ (license found within software)
# Version: 5.32.1.1
# Notes: 

{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set version = '5.32.1.1' %}
{% set hash = '241a881670164feb0b91bb69d39fbbf84c981bec0d9f8c19959f8f48fd177768' %}

strawberryperl_x64-download-only:
  file.managed:
    - name: '{{ downloads }}\strawberry-perl-{{ version }}-64bit.msi'
    - source: http://strawberryperl.com/download/{{ version }}/strawberry-perl-{{ version }}-64bit.msi
    - source_hash: sha256={{ hash }}
    - makedirs: True
