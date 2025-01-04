# Name: Reko
# Website: https://github.com/uxmal/reko
# Description: Binary decompiler
# Category: Executables
# Author: uxmal et al (https://github.com/uxmal/reko/blob/master/AUTHORS)
# License: GNU General Public License 2.0 (https://github.com/uxmal/reko/blob/master/COPYING)
# Version: 0.11.6
# Notes:

{% set version = '0.11.6' %}

include:
  - winfor.repos
  - winfor.packages.dotnet6-desktop-runtime

reko:
  pkg.installed:
    - require:
      - sls: winfor.packages.dotnet6-desktop-runtime
