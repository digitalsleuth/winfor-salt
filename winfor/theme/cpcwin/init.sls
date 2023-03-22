{% set user = salt['pillar.get']('winfor_user', 'user') %}
{% set release = grains['osrelease'] %}
{% set all_users = salt['user.list_users']() %}
{% if user in all_users %}
  {% set home = salt['user.info'](user).home %}
{% else %}
  {% set home = "C:\\Users\\" + user %}
{% endif %}
{% set PROGRAMDATA = salt['environ.get']('PROGRAMDATA') %}
{% set START_MENU = PROGRAMDATA + '\Microsoft\Windows\Start Menu\Programs' %}
{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set hash = 'c1bae838ab7759dbccac5fe44827f770bdaec4009c190e4edc218beb8f3d637c' %}
{% set case_folders = ['Evidence', 'Export', 'Temp', 'Xways'] %}
{% set portals_configs = ['portals.ptl','globalsettings.ptl'] %}
{% set shortcuts = [('Acquisition and Analysis', ['FTK Imager','Active@ Disk Editor\Active@ Disk Editor','Arsenal Image Mounter','Autopsy\Autopsy 4.20.0','Magnet AXIOM\AXIOM Examine','Magnet AXIOM\AXIOM Process','gkape','Magnet ACQUIRE\Magnet ACQUIRE','Redline\Redline','Tableau\Tableau Imager\Tableau Imager','VeraCrypt 1.25.9\VeraCrypt','X-Ways']),
                    ('Browsers', ['Firefox','Google Chrome','Google Earth Pro','Microsoft Edge']),
                    ('Databases', ['ADOQuery','DataEdit','DB Browser (SQLCipher)','DB Browser (SQLite)','DBeaver Community\DBeaver','SDBExplorer','SQLiteQuery','SQLiteStudio\SQLiteStudio']),
                    ('Document Viewers', ['Acrobat Reader','EZViewer','Notepad++','Sublime Text','Visual Studio Code\Visual Studio Code']),
                    ('E-mail', ['EHB','BitRecover EML Viewer','Kernel Exchange EDB Viewer\Kernel Exchange EDB Viewer','Kernel OST Viewer\Kernel OST Viewer','Kernel Outlook PST Viewer\Kernel Outlook PST Viewer','MailView','SysTools Outlook PST Viewer\SysTools Outlook PST Viewer']),
                    ('Log Parsers', ['EventFinder','EZViewer','LogParser-Studio','LogViewer2']),
                    ('Programming', ['Python 3.10\IDLE (Python 3.10 64-bit)','Visual Studio Code\Visual Studio Code','Windows PowerShell\Windows PowerShell ISE']),
                    ('Raw Parsers', ['Bulk Extractor 1.5.5\BEViewer with Bulk Extractor 1.5.5 (64-bit)','CyberChef','Digital Detective\DCode v5\DCode v5.5','ExifTool GUI','HHD Hex Editor Neo\Hex Editor Neo','HEXEdit','HxD Hex Editor\HxD','JSONView','Passware\Encryption Analyzer 2023 v1\Passware Encryption Analyzer 2023 v1 (64-bit)','WinHex','XMLView']),
                    ('Terminals', ['Windows PowerShell\Windows PowerShell ISE','WSL']),
                    ('Utilities', ['Digital Detective\DCode v5\DCode v5.5','FastCopy','Glossary Generator','Hasher','IrfanView\IrfanView 64 4.60','Monolith Notes',"Nuix\\Nuix Evidence Mover\\Nuix Evidence Mover",'Rufus','USB Write Blocker','WindowGrid']),
                    ('Windows Analysis', ['AutoRunner','JumpListExplorer','MFTBrowser','MFTExplorer','NirLauncher','NTFS Log Tracker','RegistryExplorer','RegRipper','SE','ShadowExplorer','ShellBagsExplorer','TimelineExplorer']),
                    ('Write Blockers', ['Tableau\Tableau Firmware Update\Tableau Firmware Update','USB Write Blocker','CDSG\WriteBlocking Validation Utility\WriteBlocking Validation Utility'])
                   ] %}

include:
  - winfor.packages.portals
  - winfor.config.user

cpcwin-theme-wallpaper-source:
  file.managed:
    - name: '{{ inpath }}\cpc-wallpaper-cmpfor-4k.png'
    - source: salt://winfor/theme/cpcwin/cpc-wallpaper-cmpfor-4k.png
    - source_hash: sha256={{ hash }}
    - makedirs: True
    - win_inheritance: True

cpcwin-theme-desktop-background-color:
  reg.present:
    - name: HKEY_CURRENT_USER\Control Panel\Colors
    - vname: Background
    - vtype: REG_SZ
    - vdata: "0 0 0"

cpcwin-theme-set-wallpaper:
  reg.present:
    - name: HKEY_CURRENT_USER\Control Panel\Desktop
    - vname: WallPaper
    - vtype: REG_SZ
    - vdata: '{{ inpath }}\cpc-wallpaper-cmpfor-4k.png'

cpcwin-theme-set-wallpaper-center:
  reg.present:
    - name: HKEY_CURRENT_USER\Control Panel\Desktop
    - vname: WallpaperStyle
    - vtype: REG_SZ
    - vdata: 10

cpcwin-theme-set-wallpaper-no-tile:
  reg.present:
    - name: HKEY_CURRENT_USER\Control Panel\Desktop
    - vname: TileWallpaper
    - vtype: REG_SZ
    - vdata: 0

cpcwin-theme-update-wallpaper:
  cmd.run:
    - name: 'RUNDLL32.EXE USER32.DLL,UpdatePerUserSystemParameters 1, True'
    - shell: cmd

{% for folder in case_folders %}

cpcwin-make-{{ folder }}-folder:
  file.directory:
    - name: 'C:\CASE_FOLDER_STRUCTURE\{{ folder }}\'
    - makedirs: True
    - replace: True
    - win_inheritance: True

{% endfor %}

{% for folder in shortcuts %}
cpcwin-shortcut-{{ folder[0] }}:
  file.directory:
    - name: '{{ inpath }}\Portals\{{ folder[0] }}'
    - makedirs: True
    - replace: True
    - win_inheritance: True
{% for shortcut in folder[1] %}
{% set shortcut = shortcut + ".lnk" %}
cpcwin-shortcut-{{ folder[0] }}-{{ shortcut }}:
  file.copy:
    - name: '{{ inpath }}\Portals\{{ folder[0] }}\'
    - source: '{{ START_MENU }}\{{ shortcut }}'
    - preserve: True
    - subdir: True
    - onlyif:
      - fun: file.file_exists
        path: '{{ START_MENU }}\{{ shortcut }}'
{% endfor %}
{% endfor %}

cpcwin-portals-end-process:
  cmd.run:
    - name: 'taskkill /F /IM "Portals.exe"'
    - bg: True
    - require:
      - sls: winfor.packages.portals

{% for config in portals_configs %}
cpcwin-portals-{{ config }}-copy:
  file.managed:
    - name: '{{ home }}\AppData\Local\Portals\{{ config }}'
    - source: salt://winfor/files/{{ config }}
    - makedirs: True
    - replace: True
    - require:
      - user: user-{{ user }}
      - sls: winfor.packages.portals

cpcwin-portals-{{ config }}-placeholder-replace:
  file.replace:
    - name: '{{ home }}\AppData\Local\Portals\{{ config }}'
    - pattern: PLACEHOLDER_PATH
    - repl: {{ inpath | regex_escape }}
    - require:
      - file: cpcwin-portals-{{ config }}-copy
{% endfor %}

cpcwin-portals-auto-run:
  reg.present:
    - name: HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Run
    - vname: Portals
    - vtype: REG_SZ
    - vdata: 'C:\Program Files\Portals\Portals.exe'
    - require:
      - sls: winfor.packages.portals

{% if release == '11' %}
cpcwin-move-start-menu-left:
  reg.present:
    - name: HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced
    - vname: TaskbarAl
    - vtype: REG_DWORD
    - vdata: 0
{% endif %}
