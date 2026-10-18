# Name: Backup2FS
# Website: https://elusivedata.io/
# Description: Apple iOS backup viewer
# Category: Mobile Analysis
# Author: James Eichbaum 
# License: Copyright (https://github.com/eichbaumj/Backup2FS#license)
# Version: 3.0.0
# Notes: 

# renovate: datasource=github-releases depName=eichbaumj/Backup2FS
{% set version = '3.0.0' %}

include:
  - winfor.repos

backup2fs:
  pkg.installed
