# Name: Scylla
# Website: https://github.com/ntquery/scylla
# Description: Imports Reconstructor written in C/C++
# Category: Executables
# Author: NtQuery
# License: GNU General Public License v3 (https://github.com/NtQuery/Scylla/blob/master/LICENSE)
# Version: 0.9.8
# Notes: May not work well on later versions of Windows 10 and any version of Windows 11

{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

scylla-download-only:
  file.managed:
    - name: '{{ downloads }}\scylla\Scylla_v0.9.8.rar'
    - source: https://github.com/NtQuery/Scylla/releases/download/v0.9.8/Scylla_v0.9.8.rar
    - source_hash: sha256=48a4338d999ec5f33b5964c51893a04fc9e2d104b0c7786f50751f7db5dcbe52
    - makedirs: True
