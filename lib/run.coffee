fs = require 'fs'
path = require 'path'
execSync = require 'exec-sync'

if fs.existsSync './config.coffee'
  config = require './config.coffee'
else if fs.existsSync path.join __dirname, '../config.coffee'
  config = require path.join __dirname, '../config.coffee'
else
  throw new Error 'No config provided'

# TODO: parse args
console.log 'Args:', process.argv

args = process.argv.splice(2)

if args[0] is 'install'
  cmd = 'ssh ' + config.ssh.host + ' "cmd /c cd %USERPROFILE% && npm install win-remote-base && echo OK || echo FAIL"'
else
  cmd = 'ssh ' + config.ssh.host + ' "cmd /c cd %USERPROFILE% && node_modules\\.bin\\base '+args.join(' ')+'"'

out = execSync cmd

if out.indexOf('The system cannot find the path specified.') == 0
  console.log 'Please install first with `run install`'

console.log out
