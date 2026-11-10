# Name: Microsoft PowerToys
# Website: https://github.com/microsoft/powertoys
# Description: Windows productivity system utilities
# Category: Utilities
# Author: Microsoft
# License: MIT (https://github.com/microsoft/PowerToys/blob/main/LICENSE)
# Version: 0.102.3001.0
# Notes:

# renovate: datasource=github-releases depName=microsoft/PowerToys
{% set version = '0.102.3001.0' %}

include:
  - winfor.repos

ms-powertoys:
  pkg.installed
