{% set download = salt['pillar.get']('downloads', None) %}
{% if not download %}

del-edge-shortcut:
  file.absent:
    - name: 'C:\Users\Public\Desktop\Microsoft Edge.lnk'

{% else %}
Edge Shortcut not deleted in download only mode:
  test.nop
{% endif %}