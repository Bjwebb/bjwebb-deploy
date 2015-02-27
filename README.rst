Ben Webb's personal website deployment
======================================

.. code-block::

    salt-ssh '*' <salt command>

Runing as a non-root user
-------------------------

For this I create ``salt-config/master.d/localuser.conf`` (first do ``mkdir salt-config/master.d``) with the following content:

.. code-block::

    cachedir: /home/bjwebb/code/bjwebb-deploy/cache/
    log_file: /home/bjwebb/code/bjwebb-deploy/log/
    pki_dir: /home/bjwebb/code/bjwebb-deploy/salt-config/pki/
    user: bjwebb

To avoid having to specify a key on the command line, I add symlinks from the default location:

.. code-block:: bash

    mkdir -p salt-config/pki/ssh
    cd salt-config/pki/ssh
    ln -s ~/.ssh/id_rsa salt-config/pki/ssh/salt-ssh.rsa
    ln -s ~/.ssh/id_rsa.pub salt-config/pki/ssh/salt-ssh.rsa.pub
