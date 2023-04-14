{% set user = salt['pillar.get']('winfor_user', 'forensics') %}
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
{% set hash = '24f62d8212f25e16cf384779c48876a11f8d9430b597f066d81c0df5ee8594c6' %}
{% set profile_pictures = ['user.png', 'user.bmp', 'user-32.png', 'user-40.png', 'user-48.png', 'user-192.png'] %}
{% set portals_configs = ['portals.ptl','globalsettings.ptl'] %}
{% set shortcuts = [('Acquisition and Analysis', ['FTK Imager','Active@ Disk Editor\Active@ Disk Editor','Arsenal Image Mounter','Autopsy\Autopsy 4.20.0','Magnet AXIOM\AXIOM Examine','Magnet AXIOM\AXIOM Process','Cerbero Suite\Cerbero Suite','Magnet ACQUIRE\Magnet ACQUIRE','Magnet Chromebook Acquisition Assistant v1\Magnet Chromebook Acquisition Assistant v1','Magnet Web Page Saver Portable V3','Tableau\Tableau Imager\Tableau Imager','X-Ways']),
                    ('Browsers', ['Firefox','Google Chrome','Microsoft Edge']),
                    ('Databases', ['ADOQuery','DataEdit','DB Browser (SQLCipher)','DB Browser (SQLite)','DBeaver Community\DBeaver','SDBExplorer','SQLiteQuery','SQLiteStudio\SQLiteStudio','SysTools SQL MDF Viewer\SysTools SQL MDF Viewer']),
                    ('Document Analysis', ['ExifTool GUI','OffVis','PDFStreamDumper\PdfStreamDumper.exe','SSView']),
                    ('Document Viewers', ['Acrobat Reader','EZViewer','LibreOffice 7.4\LibreOffice Calc','LibreOffice 7.4\LibreOffice Impress','LibreOffice 7.4\LibreOffice Writer','LibreOffice 7.4\LibreOffice','Notepad++','Sublime Text','Visual Studio Code\Visual Studio Code']),
                    ('Email', ['EHB','Email Header Analyzer - Web Based','Kernel Exchange EDB Viewer\Kernel Exchange EDB Viewer','Kernel OST Viewer\Kernel OST Viewer','Kernel Outlook PST Viewer\Kernel Outlook PST Viewer','MailView','SysTools Outlook PST Viewer\SysTools Outlook PST Viewer','BitRecover EML Viewer',"4n6 Software\\4n6 Email Forensics Wizard",'PST Walker\PST Walker']),
                    ('Executables', ['rohitab.com\API Monitor v2\API Monitor v2 (Alpha) 64-bit','BinText','Explorer Suite\CFF Explorer','Cutter','DIE','dotPeek64','ExeInfoPE','McAfee FileInsight\FileInsight','ILSpy','KsDumper11','Magnet Process Capture','MalCat','Explorer Suite\Tools\PE Detective','Process Hacker 2\PE Viewer','PE-Bear','PEiD','PEStudio','PPEE','Process Hacker 2\Process Hacker 2','Regshot x64 Unicode','Resource Hacker\Resource Hacker','Scylla x64','Explorer Suite\Signature Explorer','Explorer Suite\Task Explorer (64-bit)','VB Decompiler Lite\VB Decompiler Lite','WinDbg Preview']),
                    ('Installers', ['AutoIT Extractor','lessmsi','Py2ExeDecompiler','UniExtract']),
                    ('Logs', ['EventFinder','EZViewer','HttpLogBrowser\HttpLogBrowser','Log Parser 2.2\Log Parser 2.2','LogParser-Studio','LogViewer2']),
                    ('Mobile Analysis', ['ALEAPP-GUI','Bytecode Viewer','ILEAPP-GUI','iPhoneAnalyzer','VLEAPP-GUI','VOW Software\plist Editor Pro\plist Editor Pro']),
                    ('Network', ['Brim','Burp Suite Community Edition\Burp Suite Community Edition','Fiddler Classic','IHB','NetScanner','NetworkMiner','PuTTY (64-bit)\PSFTP','PuTTY (64-bit)\PuTTY','Wireshark']),
                    ('Raw Parsers and Decoders', ['Bulk Extractor 1.5.5\BEViewer with Bulk Extractor 1.5.5 (64-bit)','CyberChef','Digital Detective\DataDump v2\DataDump v2.0','Digital Detective\DCode v5\DCode v5.5','HHD Hex Editor Neo\Hex Editor Neo','HEXEdit','HxD Hex Editor\HxD','JSONView','Passware\Encryption Analyzer 2023 v1\Passware Encryption Analyzer 2023 v1 (64-bit)','PhotoRec','Redline\Redline','XMLView','WinHex']),
                    ('Registry', ['RegistryExplorer','RegRipper','Regshot x64 ANSI']),
                    ('Terminals', ['Cygwin\Cygwin64 Terminal','MobaXterm\MobaXterm','Terminal','WSL','VcXsrv\XLaunch']),
                    ('Utilities', ['Aurora','Digital Detective\DCode v5\DCode v5.5','EZViewer','FastCopy','Hasher','IrfanView\IrfanView 64 4.60','Monolith Notes',"Nuix\\Nuix Evidence Mover\\Nuix Evidence Mover",'Rufus','Sysinternals','Tableau\Tableau Firmware Update\Tableau Firmware Update','USB Write Blocker','WinMerge\WinMerge','Agent Ransack\Agent Ransack']),
                    ('Windows Analysis', ['AutoRunner','Event Log Explorer','EXE','gkape','Hindsight GUI','JumpListExplorer','Live Response Collection - Cedarpelta','LogFileParser64','MFTBrowser','MFTExplorer','mimikatz','NirLauncher','NTFS Log Tracker','Redline\Redline','RegistryExplorer','RegRipper','SE','ShadowExplorer','ShellBagsExplorer','SRUM-DUMP2','Sysinternals','ThumbCache Viewer','TimelineExplorer','Windows Timeline','WLEAPP-GUI','Zimmerman Tools'])
                   ] %}

include:
  - winfor.packages.portals
  - winfor.config.user

winfor-theme-wallpaper-source:
  file.managed:
    - name: '{{ inpath }}\winfor-wallpaper.png'
    - source: salt://winfor/theme/winfor/winfor-wallpaper.png
    - skip_verify: True
    - makedirs: True
    - win_inheritance: True

winfor-theme-desktop-background-color:
  reg.present:
    - name: HKEY_CURRENT_USER\Control Panel\Colors
    - vname: Background
    - vtype: REG_SZ
    - vdata: "0 0 0"

winfor-theme-set-wallpaper:
  reg.present:
    - name: HKEY_CURRENT_USER\Control Panel\Desktop
    - vname: WallPaper
    - vtype: REG_SZ
    - vdata: '{{ inpath }}\winfor-wallpaper.png'

winfor-theme-set-wallpaper-center:
  reg.present:
    - name: HKEY_CURRENT_USER\Control Panel\Desktop
    - vname: WallpaperStyle
    - vtype: REG_SZ
    - vdata: 6

winfor-theme-set-wallpaper-no-tile:
  reg.present:
    - name: HKEY_CURRENT_USER\Control Panel\Desktop
    - vname: TileWallpaper
    - vtype: REG_SZ
    - vdata: 0

winfor-theme-update-wallpaper:
  cmd.run:
    - name: 'RUNDLL32.EXE USER32.DLL,UpdatePerUserSystemParameters 1, True'
    - shell: cmd

{% for file in profile_pictures %}

winfor-theme-profile-picture-backup-{{ file }}:
  file.managed:
    - name: '{{ PROGRAMDATA }}\Microsoft\User Account Pictures\{{ file }}.bak'
    - source: '{{ PROGRAMDATA }}\Microsoft\User Account Pictures\{{ file }}'
    - skip_verify: True

winfor-theme-profile-picture-copy-{{ file }}:
  file.managed:
    - name: '{{ PROGRAMDATA }}\Microsoft\User Account Pictures\{{ file }}'
    - source: salt://winfor/theme/winfor/{{ file }}
    - skip_verify: True
    - replace: True
    - require:
      - file: winfor-theme-profile-picture-backup-{{ file }}

{% endfor %}

winfor-theme-default-profile-picture:
  reg.present:
    - name: HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer
    - vname: UseDefaultTile
    - vtype: REG_DWORD
    - vdata: 1

{% for folder in shortcuts %}
winfor-shortcut-{{ folder[0] }}:
  file.directory:
    - name: '{{ inpath }}\Portals\{{ folder[0] }}'
    - makedirs: True
    - replace: True
    - win_inheritance: True
{% for shortcut in folder[1] %}
{% set shortcut = shortcut + ".lnk" %}
winfor-shortcut-{{ folder[0] }}-{{ shortcut }}:
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

winfor-portals-end-process:
  cmd.run:
    - name: 'taskkill /F /IM "Portals.exe"'
    - bg: True
    - require:
      - sls: winfor.packages.portals

{% for config in portals_configs %}
winfor-portals-{{ config }}-copy:
  file.managed:
    - name: '{{ home }}\AppData\Local\Portals\{{ config }}'
    - source: salt://winfor/theme/winfor/{{ config }}
    - makedirs: True
    - replace: True
    - require:
      - user: user-{{ user }}
      - sls: winfor.packages.portals

winfor-portals-{{ config }}-placeholder-replace:
  file.replace:
    - name: '{{ home }}\AppData\Local\Portals\{{ config }}'
    - pattern: PLACEHOLDER_PATH
    - repl: {{ inpath | regex_escape }}
    - require:
      - file: winfor-portals-{{ config }}-copy
{% endfor %}

winfor-portals-auto-run:
  reg.present:
    - name: HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Run
    - vname: Portals
    - vtype: REG_SZ
    - vdata: 'C:\Program Files\Portals\Portals.exe'
    - require:
      - sls: winfor.packages.portals

{% if release == '11' %}
winfor-move-start-menu-left:
  reg.present:
    - name: HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced
    - vname: TaskbarAl
    - vtype: REG_DWORD
    - vdata: 0
{% endif %}

{% if grains['osrelease'] == "11" %}

WIN Skipping Start Layout on Windows 11:
  test.nop

{% else %}

win-start-layout-file:
  file.managed:
    - name: '{{ inpath }}\WIN-FOR-StartLayout.xml'
    - source: salt://winfor/config/layout/WIN-FOR-StartLayout.xml
    - win_inheritance: True
    - makedirs: True

win-start-layout-replace-placeholder:
  file.replace:
    - name: '{{ inpath }}\WIN-FOR-StartLayout.xml'
    - pattern: PLACEHOLDER_PATH
    - repl: {{ inpath | regex_escape }}
    - require:
      - file: win-start-layout-file

win-start-layout-enable-gpo:
  lgpo.set:
    - user_policy:
        "Start Menu and Taskbar\\Start Layout":
          "Start Layout File":
             '{{ inpath }}\WIN-FOR-StartLayout.xml'
    - computer_policy:
        "Start Menu and Taskbar\\Start Layout":
          "Start Layout File":
             '{{ inpath }}\WIN-FOR-StartLayout.xml'

win-disable-locked-start-stager:
  file.managed:
    - name: '{{ inpath }}\disable-locked-start.cmd'
    - source: salt://winfor/config/layout/disable-locked-start.cmd
    - win_inheritance: True
    - makedirs: True

win-disable-locked-start-layout-on-reboot-hkcu:
  reg.present:
    - name: HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\RunOnce
    - vname: "Disable Locked Start Layout"
    - vtype: REG_SZ
    - vdata: 'C:\Windows\system32\cmd.exe /q /c {{ inpath }}\disable-locked-start.cmd'
    - require:
      - lgpo: win-start-layout-enable-gpo
      - file: win-disable-locked-start-stager

win-disable-locked-start-layout-on-reboot-hklm:
  reg.present:
    - name: HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\RunOnce
    - vname: "Disable Locked Start Layout"
    - vtype: REG_SZ
    - vdata: 'C:\Windows\system32\cmd.exe /q /c {{ inpath }}\disable-locked-start.cmd'
    - require:
      - lgpo: win-start-layout-enable-gpo
      - file: win-disable-locked-start-stager

win-restart-explorer:
  cmd.run:
    - name: 'Stop-Process -ProcessName "explorer" -Confirm:$false -ErrorAction SilentlyContinue -Force'
    - shell: powershell

{% endif %}
