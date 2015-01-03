include:
  - base

nginx:
  pkg.installed

nginx-service:
  service:
    - name: nginx
    - running
    - reload: True
    - enable: True
    - watch:
      - file: /etc/nginx/sites-enabled/*
      - file: /etc/nginx/sites-available/*
