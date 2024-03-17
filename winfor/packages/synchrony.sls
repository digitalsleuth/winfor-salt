# Name: synchrony
# Website: https://github.com/relative/synchrony
# Description: Javascript Cleaner and Deobfuscator
# Category: Raw Parsers / Decoders
# Author: relative
# License: GNU General Public License v3 (https://github.com/relative/synchrony/blob/master/LICENSE.md)
# Version: 2.4.5
# Notes: Requires nodejs to install, command is 'synchrony'

include:
  - winfor.packages.nodejs
  - winfor.repos

deobfuscator:
  cmd.run:
    - name: '"C:\Program Files\nodejs\npm.cmd" install --global deobfuscator'
    - shell: cmd
    - require:
      - sls: winfor.packages.nodejs
      - sls: winfor.repos
