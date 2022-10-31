include:
  - winfor.installers.dotnetfx35

shadowexplorer:
  pkg.installed:
    - require:
      - sls: winfor.installers.dotnetfx35
