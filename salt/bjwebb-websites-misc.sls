include:
  - nginx

https://github.com/Bjwebb/bjwebb-websites-misc.git:
  git.latest:
    - rev: master
    - user: bjwebb
    - target: /home/bjwebb/bjwebb-websites-misc/

/etc/nginx/sites-available/bjwebb-websites-misc:
  file.managed:
    - source: salt://bjwebb-websites-misc-nginx

/etc/nginx/sites-enabled/bjwebb-websites-misc:
  file.symlink:
    - target: /etc/nginx/sites-available/bjwebb-websites-misc
