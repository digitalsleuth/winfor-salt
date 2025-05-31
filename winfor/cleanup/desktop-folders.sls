{% set shortcuts = [('Acquisition and Analysis', ['FEX Imager','FIT','FTK Imager','Active@ Disk Editor\Active@ Disk Editor','Arsenal Image Mounter','Autopsy\Autopsy 4.22.0','Magnet AXIOM\AXIOM Examine','Magnet AXIOM\AXIOM Process','gkape','Magnet ACQUIRE\Magnet ACQUIRE','Magnet Chromebook Acquisition Assistant v1\Magnet Chromebook Acquisition Assistant v1','Magnet Web Page Saver Portable V3','OSFMount\OSFMount','Tableau\Tableau Imager\Tableau Imager','X-Ways']),
                    ('Browsers', ['Firefox','Google Chrome','Microsoft Edge']),
                    ('Databases', ['ADOQuery','DataEdit','DB Browser (SQLCipher)','DB Browser (SQLite)','DBeaver Community\DBeaver','SDBExplorer','SQLiteQuery','SQLiteStudio\SQLiteStudio','SysTools SQL MDF Viewer\SysTools SQL MDF Viewer']),
                    ('Document Analysis', ['ExifTool GUI','OffVis','PDFStreamDumper\PdfStreamDumper.exe','SSView']),
                    ('Document Viewers', ['Acrobat Reader','EZViewer','LibreOffice\LibreOffice Calc','LibreOffice\LibreOffice Impress','LibreOffice\LibreOffice Writer','LibreOffice\LibreOffice','Notepad++','Sublime Text','Visual Studio Code\Visual Studio Code']),
                    ('Email', ['Aid4Mail 5\Aid4Mail5','EHB','Email Header Analyzer - Web Based','Kernel Exchange EDB Viewer\Kernel Exchange EDB Viewer','Kernel OST Viewer\Kernel OST Viewer','Kernel Outlook PST Viewer\Kernel Outlook PST Viewer','MailView','PST Walker Software\MSG Viewer','SysTools Outlook PST Viewer\SysTools Outlook PST Viewer','BitRecover EML Viewer',"4n6 Software\\4n6 Email Forensics Wizard",'PST Walker Software\PST Walker']),
                    ('Executables', ['rohitab.com\API Monitor v2\API Monitor v2 (Alpha) 64-bit','Explorer Suite\CFF Explorer','BinText','Cutter','DIE','dotPeek64','ExeInfoPE','McAfee FileInsight\FileInsight','ILSpy','KsDumper11','Magnet Process Capture','MalCat','Explorer Suite\Tools\PE Detective','Process Hacker 2\PE Viewer','PE-Bear','PEiD','PEStudio','PPEE','Process Hacker 2\Process Hacker 2','Regshot x64 Unicode','Rehex','Resource Hacker','Scylla x64','Explorer Suite\Signature Explorer','Explorer Suite\Task Explorer (64-bit)','VB Decompiler Lite\VB Decompiler Lite','WinDbg','x64dbg','x32dbg']),
                    ('Installers', ['AutoIT Extractor','lessmsi','MSI Viewer','Py2ExeDecompiler','UniExtract']),
                    ('Logs', ['EventFinder','EZViewer','HttpLogBrowser\HttpLogBrowser','Log Parser 2.2\Log Parser 2.2','LogParser-Studio','LogViewer2']),
                    ('Mobile Analysis', ['ALEAPP-GUI','Bytecode Viewer','ILEAPP-GUI','iPhoneAnalyzer','JD-GUI','VLEAPP-GUI','VOW Software\plist Editor Pro\plist Editor Pro']),
                    ('Network', ['Burp Suite Community Edition\Burp Suite Community Edition','Fiddler Classic','IHB','NetScanner','NetworkMiner','PuTTY (64-bit)\PSFTP','PuTTY (64-bit)\PuTTY','WinSCP','Wireshark','Zui']),
                    ('Raw Parsers and Decoders', ['Bulk Extractor 1.5.5\BEViewer with Bulk Extractor 1.5.5 (64-bit)','CyberChef','Digital Detective\DataDump v2\DataDump v2.0','Digital Detective\DCode v5\DCode v5.5','HHD Hex Editor Neo\Hex Editor Neo','HEXEdit','HxD Hex Editor\HxD','JSONView','Passware\Encryption Analyzer 2023 v4\Passware Encryption Analyzer 2023 v4 (64-bit)','PhotoRec','Redline\Redline','XMLView','WinHex']),
                    ('Registry', ['RegistryExplorer','RegRipper','Regshot x64 ANSI']),
                    ('Terminals', ['Cygwin\Cygwin64 Terminal','MobaXterm\MobaXterm','Terminal','WSL','VcXsrv\XLaunch']),
                    ('Utilities', ['Agent Ransack\Agent Ransack','Aurora','Digital Detective\DCode v5\DCode v5.5','EZViewer','FastCopy','Glossary Generator','Google Earth Pro','Hasher','IrfanView\IrfanView 64 4.62','iTunes\iTunes','Monolith Notes',"Nuix\\Nuix Evidence Mover\\Nuix Evidence Mover",'Rufus','Sysinternals','Tableau\Tableau Firmware Update\Tableau Firmware Update','TeraCopy','USB Write Blocker','VeraCrypt 1.26.7\VeraCrypt','Oracle VM VirtualBox\Oracle VM VirtualBox','VideoLAN\VLC media player','CDSG\WriteBlocking Validation Utility\WriteBlocking Validation Utility','WinMerge\WinMerge']),
                    ('Windows Analysis', ['AutoRunner','Event Log Explorer','EXE','Hibernation Recon','JumpListExplorer','Live Response Collection - Cedarpelta','LogFileParser64','MFTBrowser','MFTExplorer','NirLauncher','NTFS Log Tracker','OneDriveExplorer-GUI','Redline\Redline','RegistryExplorer','RegRipper','SE','ShadowExplorer','ShellBagsExplorer','SRUM-DUMP2','ThumbCache Viewer','TimelineExplorer','USB Detective','Volatility Workbench','Windows Timeline'])
                   ] %}
{% set PROGRAMDATA = salt['environ.get']('PROGRAMDATA') %}
{% set START_MENU = PROGRAMDATA + '\Microsoft\Windows\Start Menu\Programs' %}
{% set PROGRAMFILES = salt['environ.get']('PROGRAMFILES') %}
{% set PUBLIC = salt['environ.get']('PUBLIC') %}
{% set inpath = salt['pillar.get']('inpath', 'C:\standalone') %}

{% for folder, tool_list in shortcuts %}
shortcut-public-desktop-{{ folder }}:
  file.directory:
    - name: '{{ PUBLIC }}\Desktop\{{ folder }}'
    - makedirs: True
    - replace: True
    - win_inheritance: True
    - unless:
      - fun: file.file_exists
        path: '{{ PROGRAMFILES }}\Portals\Portals.exe'
{% for tool in tool_list %}
{% set shortcut = tool + ".lnk" %}
shortcut-public-desktop-{{ folder }}-{{ shortcut }}:
  file.copy:
    - name: '{{ PUBLIC }}\Desktop\{{ folder }}\'
    - source: '{{ START_MENU }}\{{ shortcut }}'
    - preserve: True
    - subdir: True
    - onlyif:
      - fun: file.file_exists
        path: '{{ START_MENU }}\{{ shortcut }}'
    - unless:
      - fun: file.file_exists
        path: '{{ PROGRAMFILES }}\Portals\Portals.exe'
{% endfor %}
{% endfor %}
