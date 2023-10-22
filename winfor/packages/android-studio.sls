# Name: Android Studio and SDK
# Website: https://developer.android.com/
# Description: Tools for debugging and accessing an Android device
# Category: Mobile Analysis
# Author: Google
# License: 
# Version: 2022.3.1.20
# Notes: Comes with adb and fastboot

{% set cmdline_version = '10406996' %}
{% set cmdline_hash = '9b782a54d246ba5d207110fddd1a35a91087a8aaf4057e9df697b1cbc0ef60fc' %}
{% set build_version = '34.0.0' %}
{% set platform_version = '34.0.5' %}
{% set PROGRAM_FILES = salt['environ.get']('PROGRAMFILES') %}
{% set broken_files = ['apkanalyzer.bat','lint.bat','screenshot2.bat'] %}
{% set install = 'echo y|"C:\Program Files\Common Files\Oracle\Java\javapath\java.exe" -Dcom.android.sdklib.toolsdir="C:\Program Files\Android\Android Studio\Sdk\cmdline-tools\latest" -classpath "C:\Program Files\Android\Android Studio\Sdk\cmdline-tools\latest\lib\sdkmanager-classpath.jar" com.android.sdklib.tool.sdkmanager.SdkManagerCli' %}

include:
  - winfor.packages.jdk17

android-studio:
  pkg.installed:
    - require:
      - pkg: jdk17

cmdline-tools:
  file.managed:
    - name: 'C:\salt\tempdownload\cmdline-tools-win-{{ cmdline_version }}_latest.zip'
    - source: https://dl.google.com/android/repository/commandlinetools-win-{{ cmdline_version }}_latest.zip
    - source_hash: sha256={{ cmdline_hash }}
    - makedirs: True

sdk-folder:
  file.directory:
    - name: '{{ PROGRAM_FILES }}\Android\Android Studio\Sdk\cmdline-tools'
    - makedirs: True
    - replace: True
    - win_inheritance: True

cmdline-extract:
  archive.extracted:
    - name: '{{ PROGRAM_FILES }}\Android\Android Studio\Sdk\cmdline-tools'
    - source: 'C:\salt\tempdownload\cmdline-tools-win-{{ cmdline_version }}_latest.zip'
    - enforce_toplevel: False
    - require:
      - file: sdk-folder

cmdline-tools-rename:
  file.rename:
    - name: '{{ PROGRAM_FILES }}\Android\Android Studio\Sdk\cmdline-tools\latest'
    - source: '{{ PROGRAM_FILES }}\Android\Android Studio\Sdk\cmdline-tools\cmdline-tools'
    - force: True
    - require:
      - archive: cmdline-extract

{% for file in broken_files %} 
cmdline-tools-fix-{{ file }}:
  file.replace:
    - name: '{{ PROGRAM_FILES }}\Android\Android Studio\Sdk\cmdline-tools\latest\bin\{{ file }}'
    - pattern: '%~dp0\\..'
    - repl: '"%~dp0\\.."'
    - count: 1
{% endfor %}

build-tools-install:
  cmd.run:
    - name: '{{ install }} "build-tools;{{ build_version }}"'
    - cwd: '{{ PROGRAM_FILES }}\Android\Android Studio\Sdk\cmdline-tools\latest\bin\'
    - shell: cmd
    - require:
      - file: cmdline-tools-rename

platform-tools-install:
  cmd.run:
    - name: '{{ install }} "platform-tools"'
    - cwd: '{{ PROGRAM_FILES }}\Android\Android Studio\Sdk\cmdline-tools\latest\bin\'
    - shell: cmd
    - require:
      - cmd: build-tools-install

emulator-install:
  cmd.run:
    - name: '{{ install }} "emulator"'
    - cwd: '{{ PROGRAM_FILES }}\Android\Android Studio\Sdk\cmdline-tools\latest\bin\'
    - shell: cmd
    - require:
      - cmd: platform-tools-install

platform-tools-path:
  win_path.exists:
    - name: '{{ PROGRAM_FILES }}\Android\Android Studio\Sdk\platform-tools\'
    - require:
      - cmd: platform-tools-install
