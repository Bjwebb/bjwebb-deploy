Europe/London:
    timezone.system

/root/.ssh/authorized_keys:
  file.append:
    - text: ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCt/aeDYnB9X83BV3d30ntgLqXRApEZ+7vvKdC84B9nxO30ZZ+TNThUjFkW3x+1I04/p4rmkYx2e5LdpZLMpqLzIvixel318BzMf5K4E8qBkgChk3BVD65PmhTIWyv+BdYiMLdJsv9N699yFqfLhxgU7rxnCbmjIFhOzBDcsaa2h88SFvTRYxC0rITjt4jZyFgUHj+5Sw2i/HnwaojyvooHQ+aZrXRY9hazWsFunijZ/SgOsvHgUl4MiSj2Lv4zD36vLvmJJ1CJhpe6Vzqpc6ymCmjm5IU7XfHs4AvqIFoIJdbXJMgaJO4uhBDUINrBON8WhfEpmKgN2LFohVdbH5AN bjwebb@webbpad 
    - makedirs: True

basic-server-deps:
    pkg.installed:
        - pkgs:
            - unattended-upgrades
            - git
            - screen

# https://wiki.debian.org/UnattendedUpgrades
/etc/apt/apt.conf.d/50auto-upgrades:
  file.managed:
    - source: salt://50auto-upgrades

bjwebb:
  user.present:
    - fullname: "Ben Webb"
    - home: /home/bjwebb
    - groups:
      - sudo
    - shell: /bin/bash

/home/bjwebb:
  file.directory:
    - user: bjwebb
    - group: bjwebb
    - mode: 755

/home/bjwebb/.ssh/authorized_keys:
  file.append:
    - text: ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCt/aeDYnB9X83BV3d30ntgLqXRApEZ+7vvKdC84B9nxO30ZZ+TNThUjFkW3x+1I04/p4rmkYx2e5LdpZLMpqLzIvixel318BzMf5K4E8qBkgChk3BVD65PmhTIWyv+BdYiMLdJsv9N699yFqfLhxgU7rxnCbmjIFhOzBDcsaa2h88SFvTRYxC0rITjt4jZyFgUHj+5Sw2i/HnwaojyvooHQ+aZrXRY9hazWsFunijZ/SgOsvHgUl4MiSj2Lv4zD36vLvmJJ1CJhpe6Vzqpc6ymCmjm5IU7XfHs4AvqIFoIJdbXJMgaJO4uhBDUINrBON8WhfEpmKgN2LFohVdbH5AN bjwebb@webbpad 
    - makedirs: True
    - user: bjwebb

/etc/ssh/sshd_config:
  file.append:
    - text: GatewayPorts clientspecified
