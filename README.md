# Win Remote
Controlling Windows

## TODO
Main script

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
