# This workflow should download the latest Bulk Rename Utility ZIP, and compare the previous hash
# with the current hash.

name: check-bulkrenameutility-portable-hash

on:
  schedule:
      - cron: "0 0 * * *"

  workflow_dispatch:

jobs:
  bulkrenameutility_portable_hash:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@main
      - name: Check Bulk Rename Utility Portable Hash
        run: |
          wget https://www.bulkrenameutility.co.uk/Downloads/BRU_NoInstall.zip
          PREVIOUS_HASH=$(cat /home/runner/work/winfor-salt/winfor-salt/winfor/downloads/standalones/bulkrenameutility-portable.sls | grep "set hash" | awk -F\' '{print tolower($2)}')
          CURRENT_HASH=$(sha256sum BRU_NoInstall.zip | awk '{print $1}')
          if [[ "$PREVIOUS_HASH" != "$CURRENT_HASH" ]]; then echo "HASH UPDATED - $CURRENT_HASH" && exit 1; else echo "No hash changes" && exit 0; fi
