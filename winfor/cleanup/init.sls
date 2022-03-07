# Restart explorer to get rid of graphical anomalies after debloat
# Delete the C:\salt directory which contains the tempdownloads
{% set user = salt['pillar.get']('winfor_user', 'forensics') %}
{% set all_users = salt['user.list_users']() %}
{% if user in all_users %}
  {% set home = salt['user.info'](user).home %}
{% else %}
{% set home = "C:\\Users\\" + user %}
{% endif %}

include:
  - winfor.config.user

cleanup-restart-explorer:
  cmd.run:
    - name: 'Stop-Process -ProcessName "explorer"'
    - shell: powershell

cleanup-delete-salt-temp-files:
  file.absent:
    - name: 'C:\salt'

desktop-cleanup:
  file.absent:
    - names:
      - 'C:\Public\Desktop\desktop.ini'
      - '{{ home }}\Desktop\desktop.ini'
    - require:
      - user: winfor-user-{{ user }}
      - cmd: cleanup-restart-explorer

