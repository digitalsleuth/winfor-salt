ntfs-log-tracker-download:
  file.managed:
    - name: 'C:\salt\tempdownload\ntfs-log-tracker-v1.7.zip'
    - source: 'https://drive.google.com/uc?id=1_ZzBJUytxl3RuLkMCVnW4EV7twCeF43d&export=download'
    - source_hash: sha256=e2910ac95cf0b1b9c1be4dd5831f2ef2de6a27b02af0b90d40a0653068784262
    - makedirs: True

ntfs-log-tracker-extract:
  archive.extracted:
    - name: 'C:\standalone\ntfs-log-tracker'
    - source: 'C:\salt\tempdownload\ntfs-log-tracker-v1.7.zip'
    - enforce_toplevel: False
    - watch:
      - file: ntfs-log-tracker-download

ntfs-log-tracker-env-vars:
  win_path.exists:
    - name: 'C:\standalone\ntfs-log-tracker\'

winfor-standalones-ntfs-log-tracker-shortcut:
  file.shortcut:
    - name: '{{ home }}\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\NTFS-Log-Tracker.lnk'
    - target: 'C:\standalone\ntfs-log-tracker\NTFS_Log_Tracker.exe'
    - user: {{ user }}
    - force: True
    - working_dir: 'C:\standalone\ntfs-log-tracker\'
    - makedirs: True
    - require:
      - file: ntfs-log-tracker-download
      - archive: ntfs-log-tracker-extract
      - user: winfor-user-{{ user }}
