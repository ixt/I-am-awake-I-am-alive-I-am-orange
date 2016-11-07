#!/bin/bash
# 2016-11-06 13:15:48
git add README.md
git commit -sm "$(date -u +%Y-%m-%d\ %H:%M:%S)"
git push origin master
pkill gpg-agent
gpg-agent --enable-ssh-support --daemon git push ff4500 master
