# Name: Theme (download only)
# Website: https://github.com/digitalsleuth/winfor-salt
# Description: Downloads what the Win-FOR theme needs so it can be applied by an offline install
# Category: Requirements
# Author: Corey Forman (digitalsleuth)
# License: GNU General Public License v3+
# Version: 0.0
# Notes: The theme itself is never applied by a download - winfor.theme.winfor does that for the install and offline states

include:
  - winfor.downloads.packages.portals

theme-states-download-only:
  test.nop:
    - require:
      - sls: winfor.downloads.packages.portals
