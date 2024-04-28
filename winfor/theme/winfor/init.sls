{% set user = salt['pillar.get']('winfor_user', 'forensics') %}
{% set release = grains['osrelease'] %}
{% set home = "C:\\Users\\" + user %}
{% set startup_folder = home + "\\AppData\\Roaming\\Microsoft\\Windows\\Start Menu\\Programs\\Startup\\" %}
{% set SYSTEMDRIVE = salt['environ.get']('SYSTEMDRIVE') %}
{% set PROGRAMDATA = salt['environ.get']('PROGRAMDATA') %}
{% set START_MENU = PROGRAMDATA + '\Microsoft\Windows\Start Menu\Programs' %}
{% set PS_PATH = salt['environ.get']('PSMODULEPATH').split(";")[0] %}
{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}
{% set profile_pictures = ['user.png', 'user.bmp', 'user-32.png', 'user-40.png', 'user-48.png', 'user-192.png'] %}
{% set portals_configs = ['portals.ptl','globalsettings.ptl','license.ptl'] %}
{% set vert = salt['cmd.powershell']('[int]((Get-CimInstance CIM_VideoController | Select -expand CurrentVerticalResolution) / 5)') %}
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
{% set v3 = v2 + vspacer %}
{% set horizontals = [(h1, "H1"), (h2, "H2"), (h3, "H3"), (h4, "H4"), (h5, "H5"), (h6, "H6")] %}
{% set verticals = [(v1, "V1"), (v2, "V2"), (v3, "V3")] %}
{% set dwidth = horiz * 2 %}
{% set start_folders = [('01','Acquisition and Analysis'),
                        ('02','Browsers'),
                        ('03','Databases'),
                        ('04','Document Analysis'),
                        ('05','Document Viewers'),
                        ('06','Email'),
                        ('07','Executables'),
                        ('08','Installers'),
                        ('09','Logs'),
                        ('10','Mobile Analysis'),
                        ('11','Network'),
                        ('12','Raw Parsers and Decoders'),
                        ('13','Registry'),
                        ('14','Terminals'),
                        ('15','Utilities'),
                        ('16','Windows Analysis')
                       ] %}
{% set shortcuts = [('Acquisition and Analysis', ['FEX Imager','FIT','FTK Imager','Active@ Disk Editor\Active@ Disk Editor','Arsenal Image Mounter','Autopsy\Autopsy 4.21.0','Magnet AXIOM\AXIOM Examine','Magnet AXIOM\AXIOM Process','gkape','Magnet ACQUIRE\Magnet ACQUIRE','Magnet Chromebook Acquisition Assistant v1\Magnet Chromebook Acquisition Assistant v1','Magnet Web Page Saver Portable V3','OSFMount\OSFMount','Tableau\Tableau Imager\Tableau Imager','X-Ways']),
                    ('Browsers', ['Firefox','Google Chrome','Microsoft Edge']),
                    ('Databases', ['ADOQuery','DataEdit','DB Browser (SQLCipher)','DB Browser (SQLite)','DBeaver Community\DBeaver','SDBExplorer','SQLiteQuery','SQLiteStudio\SQLiteStudio','SysTools SQL MDF Viewer\SysTools SQL MDF Viewer']),
                    ('Document Analysis', ['ExifTool GUI','OffVis','PDFStreamDumper\PdfStreamDumper.exe','SSView']),
                    ('Document Viewers', ['Acrobat Reader','EZViewer','LibreOffice 7.6\LibreOffice Calc','LibreOffice 7.6\LibreOffice Impress','LibreOffice 7.6\LibreOffice Writer','LibreOffice 7.6\LibreOffice','Notepad++','Sublime Text','Visual Studio Code\Visual Studio Code']),
                    ('Email', ['Aid4Mail 5\Aid4Mail5','EHB','Email Header Analyzer - Web Based','Kernel Exchange EDB Viewer\Kernel Exchange EDB Viewer','Kernel OST Viewer\Kernel OST Viewer','Kernel Outlook PST Viewer\Kernel Outlook PST Viewer','MailView','PST Walker Software\MSG Viewer','SysTools Outlook PST Viewer\SysTools Outlook PST Viewer','BitRecover EML Viewer',"4n6 Software\\4n6 Email Forensics Wizard",'PST Walker Software\PST Walker']),
                    ('Executables', ['rohitab.com\API Monitor v2\API Monitor v2 (Alpha) 64-bit','Explorer Suite\CFF Explorer','BinText','Cutter','DIE','dotPeek64','ExeInfoPE','McAfee FileInsight\FileInsight','IDA Freeware 8.3\IDA Freeware 8.3','ILSpy','KsDumper11','Magnet Process Capture','MalCat','Explorer Suite\Tools\PE Detective','Process Hacker 2\PE Viewer','PE-Bear','PEiD','PEStudio','Portex Analyzer','PPEE','Process Hacker 2\Process Hacker 2','Regshot x64 Unicode','Rehex','Resource Hacker','Scylla x64','Explorer Suite\Signature Explorer','Explorer Suite\Task Explorer (64-bit)','Total PE 2','VB Decompiler Lite\VB Decompiler Lite','WinDbg','x64dbg','x32dbg']),
                    ('Installers', ['AutoIT Extractor','lessmsi','MSI Viewer','Py2ExeDecompiler','UniExtract']),
                    ('Logs', ['EventFinder','EZViewer','HttpLogBrowser\HttpLogBrowser','Log Parser 2.2\Log Parser 2.2','LogParser-Studio','LogViewer2']),
                    ('Mobile Analysis', ['ALEAPP-GUI','Android Studio\Android Studio','Bytecode Viewer','iBackup Viewer\iBackup Viewer','ILEAPP-GUI','iPhoneAnalyzer','JD-GUI','VLEAPP-GUI','VOW Software\plist Editor Pro\plist Editor Pro']),
                    ('Network', ['Burp Suite Community Edition\Burp Suite Community Edition','Fiddler Classic','IHB','NetScanner','NetworkMiner','PuTTY (64-bit)\PSFTP','PuTTY (64-bit)\PuTTY','WinSCP','Wireshark','Zui']),
                    ('Raw Parsers and Decoders', ['Bulk Extractor 1.5.5\BEViewer with Bulk Extractor 1.5.5 (64-bit)','CyberChef','Digital Detective\DataDump v2\DataDump v2.2','Digital Detective\DCode v5\DCode v5.5','HHD Hex Editor Neo\Hex Editor Neo','HEXEdit','HxD Hex Editor\HxD','JSONView','Passware\Encryption Analyzer 2024 v1\Passware Encryption Analyzer 2024 v1 (64-bit)','PhotoRec','QPhotoRec','TestDisk','Time Decode','Redline\Redline','XMLView','WinHex']),
                    ('Registry', ['RegistryExplorer','RegRipper','Regshot x64 ANSI']),
                    ('Terminals', ['Cygwin\Cygwin64 Terminal','MobaXterm\MobaXterm','Terminal','WSL','VcXsrv\XLaunch']),
                    ('Utilities', ['Agent Ransack\Agent Ransack','Aurora','Digital Detective\DCode v5\DCode v5.5','EZViewer','FastCopy','Glossary Generator','Google Earth Pro','Hasher','Hash Generator','IrfanView\IrfanView 64 4.62','iTunes\iTunes','Monolith Notes',"Nuix\\Nuix Evidence Mover\\Nuix Evidence Mover",'Rufus','Sysinternals','Tableau\Tableau Firmware Update\Tableau Firmware Update','TeraCopy','USB Write Blocker','VeraCrypt 1.26.7\VeraCrypt','Oracle VM VirtualBox\Oracle VM VirtualBox','VideoLAN\VLC media player','CDSG\WriteBlocking Validation Utility\WriteBlocking Validation Utility','WinMerge\WinMerge']),
                    ('Windows Analysis', ['AutoRunner','Event Log Explorer','EXE','Hibernation Recon','JumpListExplorer','Live Response Collection - Cedarpelta','LogFileParser64','MFTBrowser','MFTExplorer','NirLauncher','NTFS Log Tracker','OneDriveExplorer-GUI','Redline\Redline','RegistryExplorer','RegRipper','SE','ShadowExplorer','ShellBagsExplorer','SRUM-DUMP2','ThumbCache Viewer','TimelineExplorer','USB Detective','Volatility Workbench','Windows Timeline','WLEAPP-GUI'])
                   ] %}

include:
  - winfor.packages.portals
  - winfor.config.user

theme-wallpaper-source:
  file.managed:
    - name: '{{ SYSTEMDRIVE }}\winfor-theme\winfor-wallpaper.png'
    - source: salt://winfor/theme/winfor/winfor-wallpaper.png
    - skip_verify: True
    - makedirs: True
    - win_inheritance: True

{% for file in profile_pictures %}

theme-profile-picture-backup-{{ file }}:
  file.managed:
    - name: '{{ PROGRAMDATA }}\Microsoft\User Account Pictures\{{ file }}.bak'
    - source: '{{ PROGRAMDATA }}\Microsoft\User Account Pictures\{{ file }}'
    - skip_verify: True

theme-profile-picture-copy-{{ file }}:
  file.managed:
    - name: '{{ PROGRAMDATA }}\Microsoft\User Account Pictures\{{ file }}'
    - source: salt://winfor/theme/winfor/{{ file }}
    - skip_verify: True
    - replace: True
    - require:
      - file: theme-profile-picture-backup-{{ file }}

{% endfor %}

theme-default-profile-picture:
  reg.present:
    - name: HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer
    - vname: UseDefaultTile
    - vtype: REG_DWORD
    - vdata: 1

{% for folder, tool_list in shortcuts %}
shortcut-{{ folder }}:
  file.directory:
    - name: '{{ inpath }}\Portals\{{ folder }}'
    - makedirs: True
    - replace: True
    - win_inheritance: True
{% for tool in tool_list %}
{% set shortcut = tool + ".lnk" %}
shortcut-{{ folder }}-{{ shortcut }}:
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

portals-end-process:
  cmd.run:
    - name: 'taskkill /F /IM "Portals.exe"'
    - bg: True
    - require:
      - sls: winfor.packages.portals

{% for config in portals_configs %}
portals-{{ config }}-copy:
  file.managed:
    - name: '{{ home }}\AppData\Local\Portals\{{ config }}'
    - source: salt://winfor/theme/winfor/{{ config }}
    - makedirs: True
    - replace: True
    - require:
      - user: user-{{ user }}
      - sls: winfor.packages.portals

portals-{{ config }}-placeholder-replace:
  file.replace:
    - name: '{{ home }}\AppData\Local\Portals\{{ config }}'
    - pattern: PLACEHOLDER_PATH
    - repl: {{ inpath | regex_escape }}
    - require:
      - file: portals-{{ config }}-copy
{% endfor %}

{% for hval, hph in horizontals %}
portals-replace-{{ hph }}:
  file.replace:
    - name: '{{ home }}\AppData\Local\Portals\portals.ptl'
    - pattern: {{ hph }}
    - repl: {{ hval }}
{% endfor %}

{% for vval, vph in verticals %}
portals-replace-{{ vph }}:
  file.replace:
    - name: '{{ home }}\AppData\Local\Portals\portals.ptl'
    - pattern: {{ vph }}
    - repl: {{ vval }}
{% endfor %}

portals-replace-width:
  file.replace:
    - name: '{{ home }}\AppData\Local\Portals\portals.ptl'
    - pattern: PWIDTH
    - repl: {{ horiz }}

portals-replace-dwidth:
  file.replace:
    - name: '{{ home }}\AppData\Local\Portals\portals.ptl'
    - pattern: DWIDTH
    - repl: {{ dwidth }}

portals-replace-height:
  file.replace:
    - name: '{{ home }}\AppData\Local\Portals\portals.ptl'
    - pattern: PHEIGHT
    - repl: {{ vert }}

theme-start-layout-file:
  file.managed:
    - name: '{{ SYSTEMDRIVE }}\winfor-theme\WIN-FOR-StartLayout.xml'
    - source: salt://winfor/config/layout/WIN-FOR-StartLayout.xml
    - win_inheritance: True
    - makedirs: True

theme-start-layout-replace-placeholder:
  file.replace:
    - name: '{{ SYSTEMDRIVE }}\winfor-theme\WIN-FOR-StartLayout.xml'
    - pattern: PLACEHOLDER_PATH
    - repl: {{ inpath | regex_escape }}
    - require:
      - file: theme-start-layout-file

{% for number, folder in start_folders %}
theme-start-shortcut-{{ folder }}:
  file.shortcut:
    - name: '{{ PROGRAMDATA }}\Microsoft\Windows\Start Menu\Programs\{{ number }} - {{ folder }}.lnk'
    - target: 'C:\Windows\explorer.exe'
    - arguments: '{{ inpath }}\Portals\{{ folder }}'
    - force: True
{% endfor %}

{% if release != '11' %}

theme-start-layout-enable-gpo:
  lgpo.set:
    - user_policy:
        "Start Menu and Taskbar\\Start Layout":
          "Start Layout File":
             '{{ SYSTEMDRIVE }}\winfor-theme\WIN-FOR-StartLayout.xml'
    - computer_policy:
        "Start Menu and Taskbar\\Start Layout":
          "Start Layout File":
             '{{ SYSTEMDRIVE }}\winfor-theme\WIN-FOR-StartLayout.xml'

{% endif %}

theme-stager:
  file.managed:
    - name: '{{ SYSTEMDRIVE }}\winfor-theme\theme-config.cmd'
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
        reg add "HKCU\Control Panel\Desktop" /v WallPaper /t REG_SZ /d "{{ SYSTEMDRIVE }}\winfor-theme\winfor-wallpaper.png" /f 1>nul
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
        {% if user != salt['environ.get']('USERNAME') %}
        echo Debloating Windows for {{ user }}
        powershell -nop -ep Bypass -File "{{ PS_PATH }}\\Win10Debloat\\Win10.ps1" -include "{{ PS_PATH }}\\Win10Debloat\\Win10.psm1" -preset "{{ PS_PATH }}\\Win10Debloat\\debloat.preset"
        {% endif %}
        echo Finished - cleaning up
        timeout /t 3 /nobreak 1>nul
        RUNDLL32.EXE USER32.DLL,UpdatePerUserSystemParameters 1, True
        exit

{% if user == salt['environ.get']('USERNAME') %}

theme-stager-on-reboot-hkcu:
  reg.present:
    - name: HKCU\Software\Microsoft\Windows\CurrentVersion\RunOnce
    - vname: "Win-FOR Theme Config"
    - vtype: REG_SZ
    - vdata: '{{ SYSTEMDRIVE }}\winfor-theme\theme-config.cmd'
    - require:
      - file: theme-stager

theme-suggest-reboot:
  cmd.run:
    - name: 'msg %username% "The theme will be fully applied once you log off then log back in."'
    - shell: cmd
    - require:
      - file: theme-stager
      - reg: theme-stager-on-reboot-hkcu

{% else %}

Load NTUSER.DAT for {{ user }}:
  cmd.run:
    - name: reg load HKU\{{ user }} C:\Users\{{ user }}\NTUSER.DAT
    - shell: cmd

Add RunOnce key to {{ user }}:
  reg.present:
    - name: HKU\{{ user }}\Software\Microsoft\Windows\CurrentVersion\RunOnce
    - vname: "Win-FOR Theme Config"
    - vtype: REG_SZ
    - vdata: '{{ SYSTEMDRIVE }}\winfor-theme\theme-config.cmd'
    - require:
      - cmd: Load NTUSER.DAT for {{ user }}

Unload NTUSER.DAT for {{ user }}:
  cmd.run:
    - name: reg unload HKU\{{ user }}
    - shell: cmd
    - require:
      - cmd: Load NTUSER.DAT for {{ user }}
      - reg: Add RunOnce key to {{ user }}

theme-suggest-reboot:
  cmd.run:
    - name: 'msg %username% "The theme will be fully applied for {{ user }} the next time they log on."'
    - shell: cmd
    - require:
      - file: theme-stager
      - cmd: Load NTUSER.DAT for {{ user }}
      - reg: Add RunOnce key to {{ user }}
      - cmd: Unload NTUSER.DAT for {{ user }}

{% endif %}
