include:
  - winfor.packages.git

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
