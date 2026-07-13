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
                ('NetScanner', '02fbf13ffcc8bfd3b3ef907b265cc4d2338309e99039f1384f2c6cd370995c66'),
                ('TMX', '6315ae767c4a33fa6c69a2d4de8be09699bad78e890835f5cf86830ba9672855'),
                ('IHB', '94d513e5507e871b7d87246676f1072a92386e0b352ef7e02473a5812fd292db'),
                ('EHB', '6ECC87D4A0061CEDC13CCC398EB66009C39C5E36931737BB1841A373DE22C363'),
                ('WFA', '57ACAE30EA14576E06822703C6211C8F0C675286C989EE0CDAFEC23578E7A9C6'),
                ('WRR', 'bc0785fbf3184a5f1c83d791bb759363d58d47fe249e77e54ef41e5fc7cb6aa9'),
                ('SSView', 'e9d05067745a4f114b22dc798c7fa99017302b39bc8798853ed1bfd4c44d27ab'),
                ('HEXEdit', 'CFE264A121C560D69E2BB95512BE407F374164F2F79D0DDC4CEB7A8D0A09C788'),
                ('MailView', 'C2590633A9B13CC9D46A41A2980347057C84D8788A4597B83FFCC057FFD5B774'),
                ('EXE', '87b3bbf80301de96b871da5f1d4ce742c38182ee2fbc4414a28a2e7133011c78'),
                ('XMLView', 'c64a87ee9d26096d3a2efc63d2c1b38fb5440a825fa5b1bdc0d50cbb2d6b7960'),
                ('JSONView', '9c6d38bc040bae98e9847539220611e4dea915d27314463e602b880c3f845b21'),
                ('SQLiteQ', '7F979A622DE9E97B9682DC09A5156A1BD872139A9DD56BA60616FB824E77AB16')
               ] %}
{% set old_url_files = ['IHB', 'EHB', 'WFA'] %}

{% for file, hash in files %}
mitec-download-only-{{ file }}:
  file.managed:
    - name: {{ downloads }}\mitec\{{ file }}.zip
  {% if file in old_url_files %}
    - source: https://www.mitec.cz/Downloads/{{ file }}.zip
  {% else %}
    - source: https://mitec.cz/wp/files/{{ file }}.zip
  {% endif %}
    - source_hash: sha256={{ hash }}
    - makedirs: true
{% endfor %}
