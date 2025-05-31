# Name: Android Studio and SDK
# Website: https://developer.android.com/
# Description: Tools for debugging and accessing an Android device
# Category: Mobile Analysis
# Author: Google
# License: 
# Version: 2024.3.2.15
# Notes: Comes with adb and fastboot, error code 1223 does not represent error - marked as success.

{% set cmdline_version = '13114758' %}
{% set cmdline_hash = '98b565cb657b012dae6794cefc0f66ae1efb4690c699b78a614b4a6a3505b003' %}
{% set as_version = '2024.3.2.15' %}
{% set as_hash = 'da717086ed055c9d91658fb973336d2973244874dd333c863e0236f98b6660d1' %}
{% set build_version = '35.0.0' %}
{% set platform_version = '35.0.0' %}
{% set PROGRAM_FILES = salt['environ.get']('PROGRAMFILES') %}
{% set broken_files = ['apkanalyzer.bat','lint.bat','screenshot2.bat'] %}
{% set install = 'echo y|"C:\Program Files\Common Files\Oracle\Java\javapath\java.exe" -Dcom.android.sdklib.toolsdir="C:\Program Files\Android\Android Studio\Sdk\cmdline-tools\latest" -classpath "C:\Program Files\Android\Android Studio\Sdk\cmdline-tools\latest\lib\sdkmanager-classpath.jar" com.android.sdklib.tool.sdkmanager.SdkManagerCli' %}

include:
  - winfor.packages.jdk17

android-studio-download:
  file.managed:
    - name: 'C:\salt\tempdownload\android-studio-{{ as_version }}-windows.exe'
    - source: https://redirector.gvt1.com/edgedl/android/studio/install/{{ as_version }}/android-studio-{{ as_version }}-windows.exe
    - source_hash: sha256={{ as_hash }}
    - makedirs: True
    - require:
      - pkg: jdk17

android-studio-install:
  cmd.run:
    - name: 'C:\salt\tempdownload\android-studio-{{ as_version }}-windows.exe /S'
    - shell: cmd
    - success_retcodes: 1223
    - require:
      - file: android-studio-download

cmdline-tools:
  file.managed:
    - name: 'C:\salt\tempdownload\cmdline-tools-win-{{ cmdline_version }}_latest.zip'
    - source: https://dl.google.com/android/repository/commandlinetools-win-{{ cmdline_version }}_latest.zip
    - source_hash: sha256={{ cmdline_hash }}
    - makedirs: True
    - require:
      - cmd: android-studio-install

sdk-folder:
  file.directory:
    - name: '{{ PROGRAM_FILES }}\Android\Android Studio\Sdk\cmdline-tools'
    - makedirs: True
    - replace: True
    - win_inheritance: True
    - require:
      - cmd: android-studio-install

cmdline-extract:
  archive.extracted:
    - name: '{{ PROGRAM_FILES }}\Android\Android Studio\Sdk\cmdline-tools'
    - source: 'C:\salt\tempdownload\cmdline-tools-win-{{ cmdline_version }}_latest.zip'
    - enforce_toplevel: False
    - require:
      - file: sdk-folder
      - cmd: android-studio-install

cmdline-tools-rename:
  file.rename:
    - name: '{{ PROGRAM_FILES }}\Android\Android Studio\Sdk\cmdline-tools\latest'
    - source: '{{ PROGRAM_FILES }}\Android\Android Studio\Sdk\cmdline-tools\cmdline-tools'
    - force: True
    - require:
      - archive: cmdline-extract
      - cmd: android-studio-install

{% for file in broken_files %} 
cmdline-tools-fix-{{ file }}:
  file.replace:
    - name: '{{ PROGRAM_FILES }}\Android\Android Studio\Sdk\cmdline-tools\latest\bin\{{ file }}'
    - pattern: '%~dp0\\..'
    - repl: '"%~dp0\\.."'
    - count: 1
    - require:
      - cmd: android-studio-install
{% endfor %}

build-tools-install:
  cmd.run:
    - name: '{{ install }} "build-tools;34.0.0"'
    - cwd: '{{ PROGRAM_FILES }}\Android\Android Studio\Sdk\cmdline-tools\latest\bin\'
    - shell: cmd
    - require:
      - file: cmdline-tools-rename
      - cmd: android-studio-install

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
