include:
  - winfor.repos

wsl2-update:
  pkg.installed:
    - require:
      - sls: winfor.repos
