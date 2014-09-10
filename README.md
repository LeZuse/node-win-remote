# Win Remote
Controlling Windows

## Prerequisites
- NPM installed on remote machine: http://nodejs.org/download/
- SSH server on remote machine, see below for instructions

## TODO
Main script
Remote base autoupdating

## Windows SSH server
- Download from http://www.freesshd.com/
- Install (do not use system service)
- Configure SSH keys or turn on password auth (beware of admin rights)
- Create users
- Run with admin rights

## Client
- Set up `~/.ssh/config` host configuration
- Use standard `ssh` command
- Optionally automate password entry: http://sourceforge.net/projects/sshpass/
  - `sshpass -p [yourpass] ssh [confighost]`

## Other
- Rsync for Win: http://www.rsync.net/resources/howto/windows_rsync.html
