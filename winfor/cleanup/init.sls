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
  - winfor.cleanup.desktop-folders

cleanup-delete-salt-temp-files:
  file.absent:
    - name: 'C:\salt'

desktop-cleanup:
  file.absent:
    - names:
      - 'C:\Users\Public\Desktop\desktop.ini'
      - '{{ home }}\Desktop\desktop.ini'
    - require:
      - user: user-{{ user }}

disk-cleanup:
  cmd.run:
    - name: 'C:\Windows\System32\cleanmgr.exe /d C: /autoclean'
    - shell: cmd

clear-salt-cache:
  cmd.run:
    - name: '"C:\Program Files\Salt Project\Salt\salt-call.exe" --local saltutil.clear_cache'
