# Additional deployment steps:
#  - Copy the hacks media directory over

include:
  - nginx

hacks:
  pkg.installed:
    - pkgs:
      - uwsgi
      - uwsgi-plugin-python
      - git-core
      - python-virtualenv

uwsgi-service:
  service:
    - name: uwsgi
    - running
    - reload: True
    - enable: True
    - watch:
      - file: /etc/uwsgi/apps-enabled/*

https://gitorious.org/bjwebb-co-uk/django-bjwebb-hacks.git:
  git.latest:
    - rev: master
    - user: bjwebb
    - target: /home/bjwebb/hacks/

/etc/nginx/sites-available/hacks:
  file.managed:
    - source: salt://hacks-nginx

/etc/uwsgi/apps-available/hacks.ini:
  file.managed:
    - source: salt://hacks-uwsgi.ini

/etc/nginx/sites-enabled/hacks:
  file.symlink:
    - target: /etc/nginx/sites-available/hacks

/etc/uwsgi/apps-enabled/hacks.ini:
  file.symlink:
    - target: /etc/uwsgi/apps-available/hacks.ini

/home/bjwebb/hacks/pyenv/:
  virtualenv.managed:
    - system_site_packages: False
    - requirements: /home/bjwebb/hacks/requirements.txt
