# Name: Android Studio and SDK
# Website: https://developer.android.com/
# Description: Tools for debugging and accessing an Android device
# Category: Mobile Analysis
# Author: Google
# License: 
# Version: 2025.3.2.6
# Notes: Emulator comes with Android Studio, adb and fastboot are in the platform-tools, Build Tools can be downloaded using sdkmanager in the cmdline tools

{% set cmdline_version = '14742923' %}
{% set cmdline_hash = 'cc610ccbe83faddb58e1aa68e8fc8743bb30aa5e83577eceb4cc168dae95f9ee' %}
{% set as_version = '2025.3.2.6' %}
{% set as_hash = '77115e3aee8fd47a936e5ade7659316ccab34d60d36f259bb78581bab0096681' %}
{% set bt_version = '34' %}
{% set bt_hash = '9be665ad74ef22bf0e489b37db465074484df79b95f26d759945d5c25a47b326' %}
{% set em_version = '36.6.9' %}
{% set em_sub = '15442530' %}
{% set em_hash = '1f1dce5299fcb6b22262fb77e0b55ac7314f863a02b26cfa5dbfa3ab9cace465' %}
{% set platform_hash = '4fe305812db074cea32903a489d061eb4454cbc90a49e8fea677f4b7af764918' %}
{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}

android-studio-download-only:
  file.managed:
    - name: '{{ downloads }}\android-studio\android-studio-{{ as_version }}-windows.exe'
    - source: https://redirector.gvt1.com/edgedl/android/studio/install/{{ as_version }}/android-studio-panda2-windows.exe
    - source_hash: sha256={{ as_hash }}
    - makedirs: True

cmdline-tools-download-only:
  file.managed:
    - name: '{{ downloads }}\android-studio\cmdline-tools-win-{{ cmdline_version }}_latest.zip'
    - source: https://dl.google.com/android/repository/commandlinetools-win-{{ cmdline_version }}_latest.zip
    - source_hash: sha256={{ cmdline_hash }}
    - makedirs: True

platform-tools-download-only:
  file.managed:
    - name: '{{ downloads }}\android-studio\platform-tools-latest-windows.zip'
    - source: https://dl.google.com/android/repository/platform-tools-latest-windows.zip
    - source_hash: sha256={{ platform_hash }}
    - makedirs: True

build-tools-download-only:
  file.managed:
    - name: '{{ downloads }}\android-studio\build-tools-{{ bt_version }}-windows.zip'
    - source: https://dl.google.com/android/repository/build-tools_r{{ bt_version }}-windows.zip
    - source_hash: sha256={{ bt_hash }}
    - makedirs: True

emulator-download-only:
  file.managed:
    - name: '{{ downloads }}\android-studio\emulator-windows_x64-{{ em_version }}.zip'
    - source: https://redirector.gvt1.com/edgedl/android/repository/emulator-windows_x64-{{ em_sub }}.zip
    - source_hash: sha256={{ em_hash }}
    - makedirs: True
