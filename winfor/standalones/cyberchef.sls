{% set version = '9.32.3' %}
{% set hash = '465cf64bdd80cf99be72bedc9dccf7fcebaeace58d77ec62d71733c3e2ba404f' %}
{% set user = salt['pillar.get']('winfor_user', 'forensics') %}
{% set home = salt['user.info'](user).home %}

include:
  - winfor.packages.firefox
  - winfor.config.user

winfor-standalones-cyberchef:
  archive.extracted:
    - name: C:\\standalone\\cyberchef
    - enforce_toplevel: False
    - source: https://github.com/gchq/CyberChef/releases/download/v{{ version}}/CyberChef_v{{ version }}.zip
    - source_hash: sha256={{ hash }}
    - overwrite: True
    - require:
      - sls: winfor.packages.firefox

#winfor-standalones-cyberchef-shortcut:
#  file.shortcut:
#    - name: {{ home }}\\Desktop\\CyberChef.lnk
#    - target: '"C:\\Program Files\\Mozilla Firefox\\firefox.exe"'
#    - argument: C:\\standalone\\cyberchef\\CyberChef_v{{ version }}.html
#    - user: forensics
#    - force: True
#    - working_dir: C:\\standalone\\cyberchef
#    - makedirs: True
#    - watch:
#      - archive: winfor-standalones-cyberchef
#    - require:
#      - sls: winfor.packages.firefox
#      - archive: winfor-standalones-cyberchef
#      - user: winfor-user-{{ user }}
