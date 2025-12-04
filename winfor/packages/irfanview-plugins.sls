# Name: IrfanView x64 Plugins
# Website: https://www.irfanview.com/64bit.htm
# Description: IrfanView Plugins
# Category: Utilities
# Author: Irfan Skiljan
# License: https://www.irfanview.com/eula.htm
# Version: 4.73
# Notes:

include:
  - winfor.packages.irfanview
  - winfor.repos

irfanview-plugins:
  pkg.installed:
    - require:
      - sls: winfor.packages.irfanview
