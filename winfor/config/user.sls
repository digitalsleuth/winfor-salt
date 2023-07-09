{% set user = salt['pillar.get']('winfor_user', 'forensics') %}
{% set locale = (salt['grains.get']('locale_info:defaultlanguage')).split("_")[0] %}
{% if locale == "fr" %}
  {% set admins = "Administrateurs" %}
  {% set users = "Utilisateurs" %}
{% else %}
  {% set admins = "Administrators" %}
  {% set users = "Users" %}
{% endif %}
{% set home = "C:\\Users\\" + user %}
{% set release = grains['osrelease'] %}
{% set all_users = salt['user.list_users']() %}
{% if user in all_users %}

user-{{ user }}:
  user.present:
    - name: {{ user }}
    - home: {{ home }}

{% else %}

Disable launching of privacy settings experience for new users:
  reg.present:
    - name: HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\OOBE
    - vname: DisablePrivacyExperience
    - vtype: REG_DWORD
    - vdata: 1

user-{{ user }}:
  user.present:
    - name: {{ user }}
    - fullname: {{ user }}
    - home: {{ home }}
    - password: forensics
    - groups:
      - {{ admins }}
      - {{ users }}
    - require:
      - reg: Disable launching of privacy settings experience for new users

Activating user profile for {{ user }}:
  cmd.run:
    - name: cmd /c
    - runas: {{ user }}
    - password: forensics
    - require:
      - user: user-{{ user }}

{% endif %}
