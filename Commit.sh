#!/bin/bash
# 2016-11-06 13:15:48
git add README.md
git commit -sm "$(date -u +%Y-%m-%d\ %H:%M:%S)"
git push origin master
pkill gpg-agent
gpg-agent --enable-ssh-support --daemon git push ff4500 master
while read entry; do
   t update "$(echo $entry | sed -s "s/# //g")"
done < README.md
COMMITID=$(git log -1 | grep -i "commit" | sed -e "s/commit //g")
COMMITURL=$(echo "https://github.com/ixt/I-am-awake-I-am-alive-I-am-orange/commit/$COMMITID")
t update "Verification: $COMMITURL"
