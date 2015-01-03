include:
  - base

dovecot-imapd:
  pkg.installed

/etc/dovecot/conf.d/10-mail.conf:
  file.patch:
    - source: salt://10-mail.patch
    - hash: md5=060c1c301b923db9b3d370708fb0504e

dovecot-service:
  service:
    - name: dovecot
    - running
    - reload: True
    - enable: True
    - watch:
      - file: /etc/dovecot/conf.d/10-mail.conf
