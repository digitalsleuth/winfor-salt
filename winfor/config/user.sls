{% set user = salt['pillar.get']('winfor_user', 'forensics') %}

{% if user == "forensics" %}
  {% set home = "C:\Users\forensics" %}
{% else %}
  {% set home = "C:\Users\" + user %}
{% endif %}

{% set all_users = salt['user.list_users']() %}

{% if user in all_users %}

winfor-user-{{ user }}:
  user.present:
    - name: {{ user }}
    - home: {{ home }}
{% else %}

winfor-user-{{ user }}:
  group.present:
    - name: {{ user }}
  user.present:
    - name: {{ user }}
    - gid: {{ user }}
    - fullname: Forensics
    - home: {{ home }}

{% endif %}
