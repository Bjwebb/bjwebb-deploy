include:
  - nginx

bjwebb@bjwebb.co.uk:~/git/old-website-archive.git:
  git.latest:
    - rev: master
    - user: bjwebb
    - target: /home/bjwebb/archive/

{% set configname = 'archive' %}

/etc/nginx/sites-available/{{ configname }}:
  file.managed:
    - source: salt://{{ configname }}-nginx
    - template: jinja

/etc/nginx/sites-enabled/{{ configname }}:
  file.symlink:
    - target: /etc/nginx/sites-available/{{ configname }}
