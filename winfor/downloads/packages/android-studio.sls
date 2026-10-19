# Name: Android Studio and SDK
# Website: https://developer.android.com/
# Description: Tools for debugging and accessing an Android device
# Category: Mobile Analysis
# Author: Google
# License: 
# Version: 2025.3.2.6
# Notes: Emulator comes with Android Studio, adb and fastboot are in the platform-tools, Build Tools can be downloaded using sdkmanager in the cmdline tools

{% from 'winfor/_macros/hashes.jinja' import get_hash %}
{% set cmdline_version = get_hash('android-studio', 'cmdline_version') %}
{% set cmdline_hash = get_hash('android-studio', 'cmdline_hash') %}
{% set as_version = get_hash('android-studio', 'as_version') %}
{% set as_hash = get_hash('android-studio', 'as_hash') %}
{% set bt_version = get_hash('android-studio', 'bt_version') %}
{% set bt_hash = get_hash('android-studio', 'bt_hash') %}
{% set em_version = get_hash('android-studio', 'em_version') %}
{% set em_sub = get_hash('android-studio', 'em_sub') %}
{% set em_hash = get_hash('android-studio', 'em_hash') %}
{% set platform_hash = get_hash('android-studio', 'platform_hash') %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

android-studio-download-only:
  file.managed:
    - name: '{{ downloads }}\android-studio\android-studio-{{ as_version }}.exe'
    - source: https://redirector.gvt1.com/edgedl/android/studio/install/{{ as_version }}/android-studio-panda2-windows.exe
    - source_hash: sha256={{ as_hash }}
    - makedirs: True

cmdline-tools-download-only:
  file.managed:
    - name: '{{ downloads }}\android-studio\cmdline-tools-{{ cmdline_version }}.zip'
    - source: https://dl.google.com/android/repository/commandlinetools-win-{{ cmdline_version }}_latest.zip
    - source_hash: sha256={{ cmdline_hash }}
    - makedirs: True

platform-tools-download-only:
  file.managed:
    - name: '{{ downloads }}\android-studio\platform-tools.zip'
    - source: https://dl.google.com/android/repository/platform-tools-latest-windows.zip
    - source_hash: sha256={{ platform_hash }}
    - makedirs: True

build-tools-download-only:
  file.managed:
    - name: '{{ downloads }}\android-studio\build-tools-{{ bt_version }}.zip'
    - source: https://dl.google.com/android/repository/build-tools_r{{ bt_version }}-windows.zip
    - source_hash: sha256={{ bt_hash }}
    - makedirs: True

emulator-download-only:
  file.managed:
    - name: '{{ downloads }}\android-studio\emulator-windows-{{ em_version }}.zip'
    - source: https://redirector.gvt1.com/edgedl/android/repository/emulator-windows_x64-{{ em_sub }}.zip
    - source_hash: sha256={{ em_hash }}
    - makedirs: True
