# Name: Notepad++
# Website: https://notepad-plus-plus.org
# Description: Free source code / text editor
# Category: Documents / Editors
# Author: Don Ho
# License: GNU General Public License 2.0 (https://notepad-plus-plus.org/)
# Version: 8.9.9.1
# Notes: 

# renovate: datasource=github-releases depName=notepad-plus-plus/notepad-plus-plus
{% set version = '8.9.9.1' %}

include:
  - winfor.repos

npp:
  pkg.installed
