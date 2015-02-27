git@github.com:Bjwebb/bookish-deploy.git:
  git.latest:
    - target: /srv/salt/bookish/

bjwebb@bjwebb.co.uk:~/git/bookish-secret.git:
  git.latest:
    - target: /srv/salt/bookish/secret/

git@github.com:Bjwebb/bjwebb-deploy.git:
  git.latest:
    - target: /srv/salt/bjwebb

salt-pkgs:
  pkgrepo.managed:
    - humanname: Logstash
    - name: deb http://debian.saltstack.com/debian wheezy-saltstack main
    - file: /etc/apt/sources.list.d/salt.list

  cmd.run:
    - name: wget -q -O- "http://debian.saltstack.com/debian-salt-team-joehealy.gpg.key" | apt-key add -
    - unless: 'apt-key list | grep debian-salt-team-joehealy'

  pkg.installed:
    - pkgs:
      - salt-api
      - salt-cloud
      - salt-master
      - salt-ssh

  service.disabled:
    - name: salt-master
