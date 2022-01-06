{% set user = salt['pillar.get']('winfor_user', 'forensics') %}
{% set home = salt['user.info'](user).home %}

include:
  - winfor.packages.git
  - winfor.config.user

winfor-standalones-logfileparser:
  git.latest:
    - name: https://github.com/jschicht/LogFileParser.git
    - target: 'C:\\standalone\\logfileparser'
    - rev: master
    - force_clone: True
    - force_reset: True
    - require:
      - sls: winfor.packages.git

logfileparser-env-vars:
  win_path.exists:
    - name: 'C:\standalone\logfileparser\'

winfor-standalones-logfileparser-shortcut:
  file.shortcut:
    - name: '{{ home }}\Desktop\LogFileParser64.lnk'
    - target: 'C:\standalone\logfileparser\LogFileParser64.exe'
    - user: forensics
    - force: True
    - working_dir: 'C:\standalone\logfileparser'
    - makedirs: True
    - require:
      - git: winfor-standalones-logfileparser
      - user: winfor-user-{{ user }}
