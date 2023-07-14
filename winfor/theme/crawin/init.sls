{% set user = salt['pillar.get']('winfor_user', 'forensics') %}
{% set release = grains['osrelease'] %}
{% set home = "C:\\Users\\" + user %}
{% set PROGRAMDATA = salt['environ.get']('PROGRAMDATA') %}
{% set START_MENU = PROGRAMDATA + '\Microsoft\Windows\Start Menu\Programs' %}
{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set portals_configs = ['portals.ptl','globalsettings.ptl'] %}
{% set shortcuts = [('Acquisition and Analysis', ['FTK Imager','Active@ Disk Editor\Active@ Disk Editor','Arsenal Image Mounter','Autopsy\Autopsy 4.20.0','Magnet AXIOM\AXIOM Examine','Magnet AXIOM\AXIOM Process','Cerbero Suite\Cerbero Suite','Magnet ACQUIRE\Magnet ACQUIRE','Magnet Chromebook Acquisition Assistant v1\Magnet Chromebook Acquisition Assistant v1','Tableau\Tableau Imager\Tableau Imager','X-Ways']),
                    ('Browsers', ['Firefox','Google Chrome','Microsoft Edge']),
                    ('Databases', ['ADOQuery','DataEdit','DB Browser (SQLCipher)','DB Browser (SQLite)','DBeaver Community\DBeaver','SDBExplorer','SQLiteQuery','SQLiteStudio\SQLiteStudio','SysTools SQL MDF Viewer\SysTools SQL MDF Viewer']),
                    ('Document Analysis', ['OffVis','PDFStreamDumper\PdfStreamDumper.exe','SSView']),
                    ('Document Viewers', ['Acrobat Reader','EZViewer','Notepad++','Sublime Text','Visual Studio Code\Visual Studio Code']),
                    ('Email', ['EHB','Metaspike, Inc\Forensic Email Collector\Forensic Email Collector','Kernel Exchange EDB Viewer\Kernel Exchange EDB Viewer','Kernel OST Viewer\Kernel OST Viewer','Kernel Outlook PST Viewer\Kernel Outlook PST Viewer','MailView','PST Walker\PST Walker','SysTools Outlook PST Viewer\SysTools Outlook PST Viewer']),
                    ('Logs', ['EventFinder','EZViewer','HttpLogBrowser\HttpLogBrowser','Log Parser 2.2\Log Parser 2.2','LogParser-Studio','LogViewer2']),
                    ('Mobile Analysis', ['ALEAPP-GUI','ILEAPP-GUI','iPhoneAnalyzer','VLEAPP-GUI']),
                    ('Network', ['Fiddler Classic','IHB','Magnet Web Page Saver Portable V3','NetScanner','PuTTY (64-bit)\PSFTP','PuTTY (64-bit)\PuTTY','Wireshark']),
                    ('Programming', ['Python 3.10\IDLE (Python 3.10 64-bit)','Visual Studio Code\Visual Studio Code','Windows PowerShell\Windows PowerShell ISE']),
                    ('Raw Parsers and Decoders', ['Bulk Extractor 1.5.5\BEViewer with Bulk Extractor 1.5.5 (64-bit)','CyberChef','Digital Detective\DataDump v2\DataDump v2.0','Digital Detective\DCode v5\DCode v5.5','HHD Hex Editor Neo\Hex Editor Neo','HEXEdit','HxD Hex Editor\HxD','JSONView','Passware\Encryption Analyzer 2023 v1\Passware Encryption Analyzer 2023 v1 (64-bit)','XMLView','WinHex']),
                    ('Terminals', ['MobaXterm\MobaXterm','WSL']),
                    ('Utilities', ['Digital Detective\DCode v5\DCode v5.5','EZViewer','FastCopy','Hasher','IrfanView\IrfanView 64 4.60','Monolith Notes',"Nuix\\Nuix Evidence Mover\\Nuix Evidence Mover",'Rufus','Sysinternals','Tableau\Tableau Firmware Update\Tableau Firmware Update','USB Write Blocker','WindowGrid','VcXsrv\XLaunch']),
                    ('Windows Analysis', ['AutoRunner','EXE','gkape','Hindsight GUI','JumpListExplorer','LogFileParser64','MFTBrowser','MFTExplorer','mimikatz','NirLauncher','NTFS Log Tracker','Redline\Redline','RegistryExplorer','RegRipper','SE','ShadowExplorer','ShellBagsExplorer','Sysinternals','Zimmerman Tools'])
                   ] %}
{% set start_folders = [('01','Acquisition and Analysis'),('02','Browsers'),('03','Databases'),('04','Document Analysis'),('05','Document Viewers'),('06','Email'),('07','Logs'),('08','Mobile Analysis'),('09','Network'),('10','Raw Parsers and Decoders'),('11','Terminals'),('12','Utilities'),('13','Windows Analysis')] %}

include:
  - winfor.packages.portals
  - winfor.config.user

crawin-theme-wallpaper-source:
  file.managed:
    - name: '{{ inpath }}\crawin-wallpaper.png'
    - source: salt://winfor/theme/crawin/crawin-wallpaper.png
    - skip_verify: True
    - makedirs: True
    - win_inheritance: True

{% for folder in shortcuts %}
crawin-shortcut-{{ folder[0] }}:
  file.directory:
    - name: '{{ inpath }}\Portals\{{ folder[0] }}'
    - makedirs: True
    - replace: True
    - win_inheritance: True
{% for shortcut in folder[1] %}
{% set shortcut = shortcut + ".lnk" %}
crawin-shortcut-{{ folder[0] }}-{{ shortcut }}:
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

crawin-portals-end-process:
  cmd.run:
    - name: 'taskkill /F /IM "Portals.exe"'
    - bg: True
    - require:
      - sls: winfor.packages.portals

{% for config in portals_configs %}
crawin-portals-{{ config }}-copy:
  file.managed:
    - name: '{{ home }}\AppData\Local\Portals\{{ config }}'
    - source: salt://winfor/theme/crawin/{{ config }}
    - makedirs: True
    - replace: True
    - require:
      - user: user-{{ user }}
      - sls: winfor.packages.portals

crawin-portals-{{ config }}-placeholder-replace:
  file.replace:
    - name: '{{ home }}\AppData\Local\Portals\{{ config }}'
    - pattern: PLACEHOLDER_PATH
    - repl: {{ inpath | regex_escape }}
    - require:
      - file: crawin-portals-{{ config }}-copy
{% endfor %}

crawin-start-layout-file:
  file.managed:
    - name: '{{ inpath }}\WIN-FOR-StartLayout.xml'
    - source: salt://winfor/config/layout/WIN-FOR-StartLayout.xml
    - win_inheritance: True
    - makedirs: True

crawin-start-layout-replace-placeholder:
  file.replace:
    - name: '{{ inpath }}\WIN-FOR-StartLayout.xml'
    - pattern: PLACEHOLDER_PATH
    - repl: {{ inpath | regex_escape }}
    - require:
      - file: crawin-start-layout-file

{% for number, folder in start_folders %}
crawin-theme-start-shortcut-{{ folder }}:
  file.shortcut:
    - name: '{{ PROGRAMDATA }}\Microsoft\Windows\Start Menu\Programs\{{ number }} - {{ folder }}.lnk'
    - target: 'C:\Windows\explorer.exe'
    - arguments: '{{ inpath }}\Portals\{{ folder }}'
    - force: True
{% endfor %}

{% if release != '11' %}

crawin-start-layout-enable-gpo:
  lgpo.set:
    - user_policy:
        "Start Menu and Taskbar\\Start Layout":
          "Start Layout File":
             '{{ inpath }}\WIN-FOR-StartLayout.xml'
    - computer_policy:
        "Start Menu and Taskbar\\Start Layout":
          "Start Layout File":
             '{{ inpath }}\WIN-FOR-StartLayout.xml'

{% endif %}

crawin-theme-stager:
  file.managed:
    - name: '{{ inpath }}\theme-config.cmd'
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
        reg add "HKCU\Control Panel\Desktop" /v WallPaper /t REG_SZ /d "{{ inpath }}\crawin-wallpaper.png" /f 1>nul
        reg add "HKCU\Control Panel\Desktop" /v WallpaperStyle /t REG_SZ /d "6" /f 1>nul
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

crawin-theme-stager-on-reboot-hkcu:
  reg.present:
    - name: HKCU\Software\Microsoft\Windows\CurrentVersion\RunOnce
    - vname: "Win-FOR Theme Config"
    - vtype: REG_SZ
    - vdata: '{{ inpath}}\theme-config.cmd'
    - require:
      - file: crawin-theme-stager

crawin-theme-suggest-reboot:
  cmd.run:
    - name: 'msg %username% "The theme will be fully applied once you log off then log back in."'
    - shell: cmd
    - require:
      - file: crawin-theme-stager
      - reg: crawin-theme-stager-on-reboot-hkcu

{% else %}

CRA Load NTUSER.DAT for {{ user }}:
  cmd.run:
    - name: reg load HKU\{{ user }} C:\Users\{{ user }}\NTUSER.DAT
    - shell: cmd

CRA Add RunOnce key to {{ user }}:
  reg.present:
    - name: HKU\{{ user }}\Software\Microsoft\Windows\CurrentVersion\RunOnce
    - vname: "Win-FOR Theme Config"
    - vtype: REG_SZ
    - vdata: '{{ inpath }}\theme-config.cmd'
    - require:
      - cmd: CRA Load NTUSER.DAT for {{ user }}

CRA Unload NTUSER.DAT for {{ user }}:
  cmd.run:
    - name: reg unload HKU\{{ user }}
    - shell: cmd
    - require:
      - cmd: CRA Load NTUSER.DAT for {{ user }}
      - reg: CRA Add RunOnce key to {{ user }}

crawin-theme-suggest-reboot:
  cmd.run:
    - name: 'msg %username% "The theme will be fully applied for {{ user }} the next time they log on."'
    - shell: cmd
    - require:
      - file: crawin-theme-stager
      - cmd: CRA Load NTUSER.DAT for {{ user }}
      - reg: CRA Add RunOnce key to {{ user }}
      - cmd: CRA Unload NTUSER.DAT for {{ user }}

{% endif %}
