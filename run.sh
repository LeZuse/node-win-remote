#!/bin/sh


# LOCAL_IP="`ifconfig en0 | grep inet | grep -v inet6 | cut -d" " -f2`"
# echo $LOCAL_IP

# Download server
# python -m SimpleHTTPServer 7777 &
# SERVER_PID=$!

# "C:\Program Files (x86)\Git\bin\sh.exe" --login -i
# C:\cygwin\bin\mintty.exe -i /Cygwin-Terminal.ico -
# C:\cygwin\bin\bash.exe
# C:\Program Files (x86)\OpenSSH\bin\sh.exe

# bitsadmin /transfer mydownloadjob  /download /priority normal http://path/to/file c:\path\local\file
#bitsadmin /transfer mydownloadjob  /download /priority normal http://192.168.1.10:7777/package.json c:\\Users\\abdoc\\Documents\\a.json
# powershell -command "& { iwr http://www.abdoc.net -OutFile abdoc.html }"

# RUN="cmd /c bitsadmin /transfer mydownloadjob  /download /priority normal http://$LOCAL_IP:7777/remote/package.json c:\\\\\\\\Users\\\\\\\\abdoc\\\\\\\\package.json"
# RUN="cmd /c echo a"
# RUN="cmd /c"
# RUN="cmd /c cd c:\\\\\\\\Users\\\\\\\\abdoc\\\\\\\\ && npm install download"
# RUN="sh -c 'echo a'"
# RUN="C:\\\\\\\\cygwin\\\\\\\\bin\\\\\\\\bash.exe -c 'echo hello'"

# Installation
# RUN="cmd /c cd %USERPROFILE% && npm instal win-remote-base && node_modules\.bin\base"

# Command
# if [ "$1" == "" ]; then
#   echo "Gimme some work"
#   echo "Usage: run.sh [command]"
#   exit 0
# fi

# RUN="cmd /c cd %USERPROFILE% && node_modules\.bin\base $1"

RUN="cmd /c echo a"

# echo $RUN

echo 'Running remote command ...\n'
# Requires setting up a remote 'win' in ~/.ssh/config
ssh win "$RUN"
# RUN="cmd /c cd c:\\\\\\\\Users\\\\\\\\abdoc\\\\\\\\ && node -e \"d=new (require('download'));d.get('http://abdoc.net/', 'abdoc.website');d.run()\""
# sshpass -p hrabe ssh win "$RUN"
# sshpass -p hrabe ssh win "cmd /c bitsadmin /transfer mydownloadjob  /download /priority normal http://$LOCAL_IP:7777/package.json c:\\\\\\\\Users\\\\\\\\abdoc\\\\\\\\Documents\\\\\\\\package.json"
# sshpass -p hrabe ssh win "$RUN"


# Cleanup
# kill $SERVER_PID
