fs = require 'fs'
path = require 'path'
SMB2 = require 'smb2'
config = require './config'

if process.argv.length < 3
  console.log 'Usage: coffee smb.coffee filename-to-transfer'
  process.exit 2

file = process.argv[2]

smb2Client = new SMB2
   share: '\\\\' + config.smb.host + '\\' + config.smb.mount
   domain: config.smb.domain
   username: config.smb.user
   password: config.smb.password

#smb2Client.readdir config.smb.user (err, files) ->
#      if err then  throw err;
#      console.log(files);

#smb2Client.readFile config.smb.user + '\\install.log', {encoding: 'utf8'}, (err, data) ->
#      if err then throw err;
#      console.log(data);

copy = (local, remote) ->
  console.log "Copying #{local} -> #{remote} ..."
  smb2Client.writeFile remote, fs.readFileSync(local), {}, (err) ->
    console.log 'OK' unless err

smb2Client.exists config.smb.user + '\\.build', (err, exists) ->
  return console.error err if err
  if not exists
    console.log "Creating target dir ..."
    smb2Client.mkdir config.smb.user + '\\.build', (err) ->
      if not err
        console.log 'OK'
        copy file, config.smb.user + '\\.build\\' + path.basename file
  else
    copy file, config.smb.user + '\\.build\\' + path.basename file
