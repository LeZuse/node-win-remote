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

switch args[0]
  when 'install'
    cmd = 'cd %USERPROFILE% && npm install win-remote-base && echo OK || echo FAIL'
  when 'command'
    throw new Error 'No command provided' unless args[1]
    exec = "ssh #{config.ssh.host} \"#{args.splice(1).join('" "')}\""
  else
    cmd = 'cd %USERPROFILE% && node_modules\\.bin\\base ' + args.join(' ')

exec = "ssh #{config.ssh.host} \"cmd /c #{cmd}\"" unless exec

out = execSync exec

if out.indexOf('The system cannot find the path specified.') == 0
  console.log 'Please install first with `run install`'

console.log out
