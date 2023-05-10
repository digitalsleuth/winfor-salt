# Name: Node.js
# Website: https://nodejs.org
# Description: Open-Source JavaScript Runtime Environment
# Category: Requirements
# Author: https://github.com/nodejs/node/blob/main/README.md#current-project-team-members
# License: Various (https://github.com/nodejs/node/blob/main/LICENSE)
# Version: 18.16.0
# Notes: 

include:
  - winfor.repos

node.js:
  pkg.installed:
    - require:
      - sls: winfor.repos
