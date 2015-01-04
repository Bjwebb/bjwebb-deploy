include:
  - nginx

/usr/share/nginx/default/404.html:
  file.managed:
    - source: salt://404.html
    - makedirs: True

/usr/share/nginx/default/index.html:
  file.managed:
    - source: salt://index.html
    - makedirs: True

{% set configname = 'bjwebb-default' %}

/etc/nginx/sites-available/{{ configname }}:
  file.managed:
    - source: salt://{{ configname }}-nginx
    - template: jinja

/etc/nginx/sites-enabled/{{ configname }}:
  file.symlink:
    - target: /etc/nginx/sites-available/{{ configname }}
