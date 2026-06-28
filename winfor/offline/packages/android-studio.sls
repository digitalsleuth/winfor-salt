# Name: Android Studio and SDK
# Website: https://developer.android.com/
# Description: Tools for debugging and accessing an Android device
# Category: Mobile Analysis
# Author: Google
# License: 
# Version: 2025.3.2.6
# Notes: Emulator comes with Android Studio, adb and fastboot are in the platform-tools, Build Tools can be downloaded using sdkmanager in the cmdline tools

{% set cmdline_version = '14742923' %}
{% set as_version = '2025.3.2.6' %}
{% set bt_version = '34' %}
{% set em_version = '36.6.9' %}
{% set PROGRAM_FILES = salt['environ.get']('PROGRAMFILES') %}
{% set broken_files = ['apkanalyzer.bat','lint.bat','screenshot2.bat'] %}
{% set downloads = salt['pillar.get']('offline', 'C:\winfor-downloads') %}
{% set install = 'echo y|"C:\Program Files\Common Files\Oracle\Java\javapath\java.exe" -Dcom.android.sdklib.toolsdir="C:\Program Files\Android\Android Studio\Sdk\cmdline-tools\latest" -classpath "C:\Program Files\Android\Android Studio\Sdk\cmdline-tools\latest\lib\sdkmanager-classpath.jar" com.android.sdklib.tool.sdkmanager.SdkManagerCli' %}
{% set pkg = 'android-studio-'~ as_version ~'.exe' %}
{% set as_exists = salt['file.file_exists'](downloads + '\\android-studio\\' + pkg) %}

{% if as_exists %}
include:
  - winfor.offline.packages.jdk17

android-studio-install-offline:
  cmd.run:
    - name: '{{ pkg }} /S'
    - shell: cmd
    - cwd: '{{ downloads }}\android-studio'
    - success_retcodes: 1223

sdk-folder-offline:
  file.directory:
    - name: '{{ PROGRAM_FILES }}\Android\Android Studio\Sdk\cmdline-tools'
    - makedirs: True
    - replace: True
    - win_inheritance: True
    - require:
      - cmd: android-studio-install-offline

cmdline-extract-offline:
  archive.extracted:
    - name: '{{ PROGRAM_FILES }}\Android\Android Studio\Sdk\cmdline-tools'
    - source: '{{ downloads }}\android-studio\cmdline-tools-{{ cmdline_version }}.zip'
    - enforce_toplevel: False
    - require:
      - file: sdk-folder-offline
      - cmd: android-studio-install-offline

cmdline-tools-rename-offline:
  file.rename:
    - name: '{{ PROGRAM_FILES }}\Android\Android Studio\Sdk\cmdline-tools\latest'
    - source: '{{ PROGRAM_FILES }}\Android\Android Studio\Sdk\cmdline-tools\cmdline-tools'
    - force: True
    - require:
      - archive: cmdline-extract-offline
      - cmd: android-studio-install-offline

{% for file in broken_files %}
cmdline-tools-fix-{{ file }}-offline:
  file.replace:
    - name: '{{ PROGRAM_FILES }}\Android\Android Studio\Sdk\cmdline-tools\latest\bin\{{ file }}'
    - pattern: '%~dp0\\..'
    - repl: '"%~dp0\\.."'
    - count: 1
    - require:
      - cmd: android-studio-install-offline
{% endfor %}

build-tools-extract-offline:
  archive.extracted:
    - name: '{{ PROGRAM_FILES }}\Android\Android Studio\Sdk\build-tools'
    - source: '{{ downloads }}\android-studio\build-tools-{{ bt_version }}.zip'
    - enforce_toplevel: False
    - require:
      - file: sdk-folder-offline
      - cmd: android-studio-install-offline

platform-tools-extract-offline:
  archive.extracted:
    - name: '{{ PROGRAM_FILES }}\Android\Android Studio\Sdk\'
    - source: '{{ downloads }}\android-studio\platform-tools.zip'
    - force: True

emulator-extract-offline:
  archive.extracted:
    - name: '{{ PROGRAM_FILES }}\Android\Android Studio\Sdk\'
    - source: '{{ downloads }}\android-studio\emulator-windows-{{ em_version }}.zip'
    - force: True
    - require:
      - file: sdk-folder-offline

platform-tools-path-offline:
  win_path.exists:
    - name: '{{ PROGRAM_FILES }}\Android\Android Studio\Sdk\platform-tools\'
    - require:
      - archive: platform-tools-extract-offline

{% else %}
{{ pkg }} does not exist - not installing:
  test.nop
{% endif %}
