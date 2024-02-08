{% set user = salt['pillar.get']('winfor_user', 'user') %}
{% set release = grains['osrelease'] %}
{% set home = "C:\\Users\\" + user %}
{% set PROGRAMDATA = salt['environ.get']('PROGRAMDATA') %}
{% set START_MENU = PROGRAMDATA + '\Microsoft\Windows\Start Menu\Programs' %}
{% set SYSTEMDRIVE = salt['environ.get']('SYSTEMDRIVE') %}
{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set case_folders = ['Evidence', 'Export', 'Temp', 'Xways'] %}
{% set profile_pictures = ['user.png', 'user.bmp', 'user-32.png', 'user-40.png', 'user-48.png', 'user-192.png'] %}
{% set portals_configs = ['portals.ptl','globalsettings.ptl','license.ptl'] %}
{% set xwver = '207' %}
{% set zips = ['FTK-Imager-4-7-1-2-portable.zip', 'FTK-Imager-3-2-0-0-portable.zip', 'searchkit.zip'] %}
{% set folders = ['PE01', 'PE03', 'PE04', 'PE05', 'PE06', 'PE07'] %}
{% set vert = salt['cmd.powershell']('[int]((Get-CimInstance CIM_VideoController | Select -expand CurrentVerticalResolution) / 4)') %}
{% set horiz = salt['cmd.powershell']('[int]((Get-CimInstance CIM_VideoController | Select -expand CurrentHorizontalResolution) / 8)') %}
{% set hspacer = horiz + 1 %}
{% set h1 = horiz  %}
{% set h2 = h1 + hspacer %}
{% set h3 = h2 + hspacer %}
{% set h4 = h3 + hspacer %}
{% set h5 = h4 + hspacer %}
{% set h6 = h5 + hspacer %}
{% set vspacer = vert + 1 %}
{% set v1 = vert %}
{% set v2 = v1 + vspacer %}
{% set horizontals = [(h1, "H1"), (h2, "H2"), (h3, "H3"), (h4, "H4"), (h5, "H5"), (h6, "H6")] %}
{% set verticals = [(v1, "V1"), (v2, "V2")] %}
{% set shortcuts = [('Acquisition and Analysis', ['FTK Imager','Active@ Disk Editor\Active@ Disk Editor','Arsenal Image Mounter','Autopsy\Autopsy 4.21.0','gkape','Magnet AXIOM\AXIOM Examine','Magnet AXIOM\AXIOM Process','Magnet ACQUIRE\Magnet ACQUIRE','Redline\Redline','Tableau\Tableau Imager\Tableau Imager','VeraCrypt 1.25.9\VeraCrypt','X-Ways']),
                    ('Browsers', ['Firefox','Google Chrome','Microsoft Edge']),
                    ('Databases', ['ADOQuery','DataEdit','DB Browser (SQLCipher)','DB Browser (SQLite)','DBeaver Community\DBeaver','SDBExplorer','SQLiteQuery','SQLiteStudio\SQLiteStudio']),
                    ('Document Viewers', ['Acrobat Reader','EZViewer','Notepad++','Sublime Text','Visual Studio Code\Visual Studio Code']),
                    ('E-mail', ['EHB','BitRecover EML Viewer','Kernel Exchange EDB Viewer\Kernel Exchange EDB Viewer','Kernel OST Viewer\Kernel OST Viewer','Kernel Outlook PST Viewer\Kernel Outlook PST Viewer','MailView','PST Walker Software\MSG Viewer','PST Walker Software\PST Walker','SysTools Outlook PST Viewer\SysTools Outlook PST Viewer']),
                    ('Log Parsers', ['EventFinder','EZViewer','LogParser-Studio','LogViewer2']),
                    ('Programming', ['Python 3.10\IDLE (Python 3.10 64-bit)','Visual Studio Code\Visual Studio Code','Windows PowerShell\Windows PowerShell ISE']),
                    ('Raw Parsers', ['Bulk Extractor 1.5.5\BEViewer with Bulk Extractor 1.5.5 (64-bit)','CyberChef','Digital Detective\DCode v5\DCode v5.5','ExifTool GUI','HHD Hex Editor Neo\Hex Editor Neo','HEXEdit','HxD Hex Editor\HxD','JSONView','Passware\Encryption Analyzer 2024 v1\Passware Encryption Analyzer 2024 v1 (64-bit)','Time Decode','WinHex','XMLView']),
                    ('Terminals', ['Windows PowerShell\Windows PowerShell ISE','WSL']),
                    ('Utilities', ['Agent Ransack\Agent Ransack','Digital Detective\DCode v5\DCode v5.5','FastCopy','Glossary Generator','Google Earth Pro','Hasher','IrfanView\IrfanView 64 4.62','Monolith Notes',"Nuix\\Nuix Evidence Mover\\Nuix Evidence Mover",'Rufus','USB Write Blocker','VeraCrypt 1.26.7\VeraCrypt','Oracle VM VirtualBox\Oracle VM VirtualBox','VideoLAN\VLC media player','WindowGrid']),
                    ('Windows Analysis', ['AutoRunner','gkape','Hibernation Recon','Hindsight GUI','JumpListExplorer','MFTBrowser','MFTExplorer','mimikatz','NirLauncher','NTFS Log Tracker','RegistryExplorer','RegRipper','SE','ShadowExplorer','ShellBagsExplorer','Sysinternals','TimelineExplorer','Zimmerman Tools']),
                    ('Write Blockers', ['Tableau\Tableau Firmware Update\Tableau Firmware Update','USB Write Blocker','CDSG\WriteBlocking Validation Utility\WriteBlocking Validation Utility'])
                   ] %}
{% set start_folders = [('01','Acquisition and Analysis'),
                        ('02','Browsers'),
                        ('03','Databases'),
                        ('04','Document Viewers'),
                        ('05','E-mail'),
                        ('06','Log Parsers'),
                        ('07','Programming'),
                        ('08','Raw Parsers'),
                        ('09','Terminals'),
                        ('10','Utilities'),
                        ('11','Windows Analysis'),
                        ('12','Write Blockers')
                       ] %}

include:
  - winfor.packages.portals
  - winfor.config.user

cpcwin-theme-wallpaper-source:
  file.managed:
    - name: '{{ SYSTEMDRIVE }}\cpcwin-theme\cpc-wallpaper-cmpfor-4k.png'
    - source: salt://winfor/theme/cpcwin/cpc-wallpaper-cmpfor-4k.png
    - skip_verify: True
    - makedirs: True
    - win_inheritance: True

{% for file in profile_pictures %}

cpcwin-theme-profile-picture-backup-{{ file }}:
  file.managed:
    - name: '{{ PROGRAMDATA }}\Microsoft\User Account Pictures\{{ file }}.bak'
    - source: '{{ PROGRAMDATA }}\Microsoft\User Account Pictures\{{ file }}'
    - skip_verify: True

cpcwin-theme-profile-picture-copy-{{ file }}:
  file.managed:
    - name: '{{ PROGRAMDATA }}\Microsoft\User Account Pictures\{{ file }}'
    - source: salt://winfor/theme/cpcwin/{{ file }}
    - skip_verify: True
    - replace: True
    - require:
      - file: cpcwin-theme-profile-picture-backup-{{ file }}

{% endfor %}

{% for folder in case_folders %}

cpcwin-make-{{ folder }}-folder:
  file.directory:
    - name: 'C:\CASE_FOLDER_STRUCTURE\{{ folder }}\'
    - makedirs: True
    - replace: True
    - win_inheritance: True

{% endfor %}

{% for folder, tool_list in shortcuts %}
cpcwin-shortcut-{{ folder }}:
  file.directory:
    - name: '{{ inpath }}\Portals\{{ folder }}'
    - makedirs: True
    - replace: True
    - win_inheritance: True
{% for tool in tool_list %}
{% set shortcut = tool + ".lnk" %}
cpcwin-shortcut-{{ folder }}-{{ shortcut }}:
  file.copy:
    - name: '{{ inpath }}\Portals\{{ folder }}\'
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
    - source: salt://winfor/theme/cpcwin/{{ config }}
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

{% for hval, hph in horizontals %}
cpcwin-portals-replace-{{ hph }}:
  file.replace:
    - name: '{{ home }}\AppData\Local\Portals\portals.ptl'
    - pattern: {{ hph }}
    - repl: {{ hval }}
{% endfor %}

{% for vval, vph in verticals %}
cpcwin-portals-replace-{{ vph }}:
  file.replace:
    - name: '{{ home }}\AppData\Local\Portals\portals.ptl'
    - pattern: {{ vph }}
    - repl: {{ vval }}
{% endfor %}

cpcwin-portals-replace-width:
  file.replace:
    - name: '{{ home }}\AppData\Local\Portals\portals.ptl'
    - pattern: PWIDTH
    - repl: {{ horiz }}

cpcwin-portals-replace-height:
  file.replace:
    - name: '{{ home }}\AppData\Local\Portals\portals.ptl'
    - pattern: PHEIGHT
    - repl: {{ vert }}

{% for zip in zips %}
{{ zip }}-zip-copy:
  file.managed:
    - name: 'C:\salt\tempdownload\{{ zip }}'
    - source: salt://winfor/files/{{ zip }}
    - makedirs: True

{{ zip }}-zip-extract:
  archive.extracted:
    - name: 'C:\SEARCHKIT_USB\'
    - source: 'C:\salt\tempdownload\{{ zip }}'
    - enforce_toplevel: False
    - require:
      - file: {{ zip }}-zip-copy

{% endfor %}
{% for folder in folders %}

searchkit-{{ folder }}-folder:
  file.directory:
    - name: 'C:\SEARCHKIT_USB\Evidence\{{ folder }}\'
    - makedirs: True
    - replace: True
    - win_inheritance: True

{% endfor %}
{% if salt['file.directory_exists']('C:\\xwf') %}

xways-file-type-categories-user:
  file.managed:
    - name: 'C:\xwf\File Type Categories User.txt'
    - source: salt://winfor/files/File_Type_Categories_User.txt
    - skip_verify: True

xways-folder-copy:
  file.copy:
    - name: 'C:\CASE_FOLDER_STRUCTURE\X-Ways{{ xwver }}'
    - source: 'C:\xwf'
    - preserve: True
    - subdir: True
    - require:
      - file: xways-file-type-categories-user
{% endif %}

cpc-start-layout-file:
  file.managed:
    - name: '{{ SYSTEMDRIVE }}\cpcwin-theme\WIN-FOR-StartLayout.xml'
    - source: salt://winfor/config/layout/WIN-FOR-StartLayout.xml
    - win_inheritance: True
    - makedirs: True

cpc-start-layout-replace-placeholder:
  file.replace:
    - name: '{{ SYSTEMDRIVE }}\cpcwin-theme\WIN-FOR-StartLayout.xml'
    - pattern: PLACEHOLDER_PATH
    - repl: {{ inpath | regex_escape }}
    - require:
      - file: cpc-start-layout-file

{% for number, folder in start_folders %}
cpc-theme-start-shortcut-{{ folder }}:
  file.shortcut:
    - name: '{{ PROGRAMDATA }}\Microsoft\Windows\Start Menu\Programs\{{ number }} - {{ folder }}.lnk'
    - target: 'C:\Windows\explorer.exe'
    - arguments: '{{ inpath }}\Portals\{{ folder }}'
    - force: True
{% endfor %}

{% if release != '11' %}

cpc-start-layout-enable-gpo:
  lgpo.set:
    - user_policy:
        "Start Menu and Taskbar\\Start Layout":
          "Start Layout File":
             '{{ SYSTEMDRIVE }}\cpcwin-theme\WIN-FOR-StartLayout.xml'
    - computer_policy:
        "Start Menu and Taskbar\\Start Layout":
          "Start Layout File":
             '{{ SYSTEMDRIVE }}\cpcwin-theme\WIN-FOR-StartLayout.xml'

{% endif %}

cpc-theme-stager:
  file.managed:
    - name: '{{ SYSTEMDRIVE }}\cpcwin-theme\theme-config.cmd'
    - win_inheritance: True
    - makedirs: True
    - replace: True
    - contents: |
        @echo off
        setlocal EnableDelayedExpansion
        title Disable Locked Start Layout - Enable Theme
        %1 %2 mshta vbscript:createobject("shell.application").shellexecute("%~s0","goto :runas","","runas",1)(window.close)&goto :eof
        :runas
        echo Forcing update of GPO's
        gpupdate /force
        timeout /t 3 /nobreak 1>nul
        echo Disabling locked start menu layout
        {% if release != '11' %}
        reg add HKLM\SOFTWARE\Policies\Microsoft\Windows\Explorer /v LockedStartLayout /t REG_DWORD /d 0 /f 1>nul
        reg add HKCU\Software\Policies\Microsoft\Windows\Explorer /v LockedStartLayout /t REG_DWORD /d 0 /f 1>nul
        {% endif %}
        reg add "HKCU\Control Panel\Colors" /v Background /t REG_SZ /d "0 0 0" /f 1>nul
        reg add "HKCU\Control Panel\Desktop" /v WallPaper /t REG_SZ /d "{{ SYSTEMDRIVE }}\cpcwin-theme\cpc-wallpaper-cmpfor-4k.png" /f 1>nul
        reg add "HKCU\Control Panel\Desktop" /v WallpaperStyle /t REG_SZ /d "10" /f 1>nul
        reg add "HKCU\Control Panel\Desktop" /v TileWallpaper /t REG_SZ /d "0" /f 1>nul
        RUNDLL32.EXE USER32.DLL,UpdatePerUserSystemParameters 1, True
        echo Display reset exited with error code %ERRORLEVEL%
        reg add HKCU\Software\Microsoft\Windows\CurrentVersion\Run /v Portals /t REG_SZ /d "C:\Program Files\Portals\Portals.exe" /f 1>nul
        {% if release == '11' %}
        reg add HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced /v TaskbarAl /t REG_DWORD /d "0" /f 1>nul
        {% endif %}
        echo Restarting Explorer...
        timeout /t 1 /nobreak 1>nul
        taskkill /F /IM explorer.exe & start explorer
        echo Finished - cleaning up
        timeout /t 3 /nobreak 1>nul
        RUNDLL32.EXE USER32.DLL,UpdatePerUserSystemParameters 1, True
        exit

{% if user == salt['environ.get']('USERNAME') %}

cpc-theme-stager-on-reboot-hkcu:
  reg.present:
    - name: HKCU\Software\Microsoft\Windows\CurrentVersion\RunOnce
    - vname: "Win-FOR Theme Config"
    - vtype: REG_SZ
    - vdata: '{{ SYSTEMDRIVE }}\cpcwin-theme\theme-config.cmd'
    - require:
      - file: cpc-theme-stager

cpc-theme-suggest-reboot:
  cmd.run:
    - name: 'msg %username% "The theme will be fully applied once you log off then log back in."'
    - shell: cmd
    - require:
      - file: cpc-theme-stager
      - reg: cpc-theme-stager-on-reboot-hkcu

{% else %}

CPC Load NTUSER.DAT for {{ user }}:
  cmd.run:
    - name: reg load HKU\{{ user }} C:\Users\{{ user }}\NTUSER.DAT
    - shell: cmd

CPC Add RunOnce key to {{ user }}:
  reg.present:
    - name: HKU\{{ user }}\Software\Microsoft\Windows\CurrentVersion\RunOnce
    - vname: "Win-FOR Theme Config"
    - vtype: REG_SZ
    - vdata: '{{ SYSTEMDRIVE }}\cpcwin-theme\theme-config.cmd'
    - require:
      - cmd: CPC Load NTUSER.DAT for {{ user }}

CPC Unload NTUSER.DAT for {{ user }}:
  cmd.run:
    - name: reg unload HKU\{{ user }}
    - shell: cmd
    - require:
      - cmd: CPC Load NTUSER.DAT for {{ user }}
      - reg: CPC Add RunOnce key to {{ user }}

cpc-theme-suggest-reboot:
  cmd.run:
    - name: 'msg %username% "The theme will be fully applied for {{ user }} the next time they log on."'
    - shell: cmd
    - require:
      - file: cpc-theme-stager
      - cmd: CPC Load NTUSER.DAT for {{ user }}
      - reg: CPC Add RunOnce key to {{ user }}
      - cmd: CPC Unload NTUSER.DAT for {{ user }}

{% endif %}
