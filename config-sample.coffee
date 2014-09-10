# Modify to your needs and save as `config.coffee`

module.exports =
  remote: '192.168.1.1'
  ssh:
    host: 'remotebox1' # According to ~/.ssh/config

  smb:
    host: '192.168.1.1'
    domain: 'WORKGROUP'
    user: 'microsoft'
    password: 'bill'
    mount: 'Users' # Samba mount point
