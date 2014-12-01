fs = require 'fs'
path = require 'path'
SMB2 = require 'smb2'

if fs.existsSync path.join process.cwd(), './config.coffee'
  config = require path.join process.cwd(), './config.coffee'
else if fs.existsSync path.join __dirname, '../config.coffee'
  config = require path.join __dirname, '../config.coffee'
else
  throw new Error 'No config provided'

if process.argv.length < 3
  console.log 'Usage: coffee smb-get.coffee filename-to-transfer'
  process.exit 2

file = process.argv[2]
console.log file
smb = new SMB2
   share: '\\\\' + config.smb.host + '\\' + config.smb.mount
   domain: config.smb.domain
   username: config.smb.user
   password: config.smb.password

smb.exists config.smb.user + '\\.build\\' + file, (err, exists) ->
  return console.error err if err
  if not exists
    console.log "Does not exist: #{file}"
    smb.close()
  else
    smb.readFile config.smb.user + '\\.build\\' + file, (err, data) ->
      return console.error err if err
      fs.writeFileSync path.basename(file.replace '\\', '/'), data
      smb.close()
