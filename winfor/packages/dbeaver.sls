# Name: dbeaver
# Website: https://github.com/dbeaver/dbeaver
# Description: SQL Database tool and client
# Category: Databases
# Author: Serge Rider and Contributors (https://github.com/dbeaver/dbeaver/graphs/contributors)
# License: Apache License 2.0 (https://github.com/dbeaver/dbeaver/blob/devel/LICENSE.md)
# Version: 26.2.5
# Notes: 

# renovate: datasource=github-releases depName=dbeaver/dbeaver
{% set version = '26.2.5' %}

include:
  - winfor.repos

dbeaver:
  pkg.installed
