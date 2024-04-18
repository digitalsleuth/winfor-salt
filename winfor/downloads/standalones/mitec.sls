# Name: MiTeC Tool Suite
# Website: https://mitec.cz
# Description: Suite of Windows-based analysis tools
# Category: Windows Analysis
# Author: Michal Mutl (mitec)
# License: Free to use for private, educational and non-commercial purposes
# Version: Various
# Notes:

{% set downloads = salt['pillar.get']('downloads', 'C:\winfor-downloads') %}
{% set files = [
                ('ADOQuery', 'A412293B10AD00B0A94509CD48AD389C4F609B96FA504CCBBB2501742E3AD96D'),
                ('DataEdit', '9F950880508760C6709CCAADDC9D630903C9AE661DC99C50A5BAA85642141C46'),
                ('NetScanner', 'bcb770b8d9090338ebbd429da621c063350286ed7721d1f2703010efe67bec37'),
                ('TMX', 'ad4a14cd03c3ae53776cb744874ad4f592fd96c23260b466b43e4e8d08e7cae9'),
                ('SE', 'F9CEF0A01409A03B6EE42A6AE4AE64A71A4923CDA3E1E62C0E5998AF03FC938F'),
                ('IHB', '94d513e5507e871b7d87246676f1072a92386e0b352ef7e02473a5812fd292db'),
                ('EHB', '6ECC87D4A0061CEDC13CCC398EB66009C39C5E36931737BB1841A373DE22C363'),
                ('WFA', '57ACAE30EA14576E06822703C6211C8F0C675286C989EE0CDAFEC23578E7A9C6'),
                ('WRR', '1f600b1387ef7a23344f8fa1330116b8f9ca654d0a20f50ab6b25f4c61e7631e'),
                ('SSView', 'e9d05067745a4f114b22dc798c7fa99017302b39bc8798853ed1bfd4c44d27ab'),
                ('HEXEdit', 'CFE264A121C560D69E2BB95512BE407F374164F2F79D0DDC4CEB7A8D0A09C788'),
                ('MailView', 'C2590633A9B13CC9D46A41A2980347057C84D8788A4597B83FFCC057FFD5B774'),
                ('EXE', 'b82ef588e3fd2c83fde19d8ce75fdaf474b935d3fc19ad549a2782875d036c58'),
                ('XMLView', 'c64a87ee9d26096d3a2efc63d2c1b38fb5440a825fa5b1bdc0d50cbb2d6b7960'),
                ('JSONView', '0f687010c7337ff95acf701d8d3883893393b43ba2dd01e9153240e0c46d6839'),
                ('PhotoView', '6BCBB3AAFD3DB71E7CBDFB75D78934101DED79A5792F52FBAE600EC16910795C'),
                ('SQLiteQ', '7F979A622DE9E97B9682DC09A5156A1BD872139A9DD56BA60616FB824E77AB16')
               ] %}

{% for file, hash in files %}
mitec-download-only-{{ file }}:
  file.managed:
    - name: {{ downloads }}\mitec\{{ file }}.zip
    - source: http://mitec.cz/Downloads/{{ file }}.zip
    - source_hash: sha256={{ hash }}
    - makedirs: true
{% endfor %}
