# Name: IrfanView x64 Plugins
# Website: https://www.irfanview.com/64bit.htm
# Description: IrfanView Plugins
# Category: Utilities
# Author: Irfan Skiljan
# License: https://www.irfanview.com/eula.htm
# Version: 4.72
# Notes:

{% set version = '472' %}
{% set hash = 'fd42553c31ca827eca015845526f2ca42b73ea2f7d2deb42d2381417f8554ef3' %}

include:
  - winfor.packages.irfanview
  - winfor.repos

irfanview-plugins:
  pkg.installed:
    - require:
      - sls: winfor.packages.irfanview
