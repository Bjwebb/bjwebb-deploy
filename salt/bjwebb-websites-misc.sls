include:
  - nginx

https://github.com/Bjwebb/bjwebb-websites-misc.git:
  git.latest:
    - rev: master
    - user: bjwebb
    - target: /home/bjwebb/bjwebb-websites-misc/

{% set configname = 'bjwebb-websites-misc' %}

/etc/nginx/sites-available/{{ configname }}:
  file.managed:
    - source: salt://{{ configname }}-nginx
    - template: jinja

/etc/nginx/sites-enabled/{{ configname }}:
  file.symlink:
    - target: /etc/nginx/sites-available/{{ configname }}
