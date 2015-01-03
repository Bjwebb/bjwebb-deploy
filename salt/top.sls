base:
  '*':
    - base
  'hacks':
    - hacks
  'gabbleduck':
    - bjwebb-default
    - bjwebb-websites-misc
    - dovecot
    # Also need to copy the Maildir
    # su bjwebb; cd ~; rsync -av bjwebb@gabbleduck.default.bjwebb.uk0.bigv.io:~/Maildir .
    # (self signed certificate doesn't necessarily need copying, but if not, the new one will need to be verified)
    - archive
  'logserver':
    - logserver
