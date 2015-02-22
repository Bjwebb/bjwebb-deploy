Runing as a non-root user
-------------------------

For this I create ``salt-config/master.d/localuser.conf`` with the following content:

.. code-block::

    cachedir: /home/bjwebb/code/bjwebb-deploy/cache/
    log_file: /home/bjwebb/code/bjwebb-deploy/log/
    pki_dir: /home/bjwebb/code/bjwebb-deploy/salt-config/pki/
    user: bjwebb
