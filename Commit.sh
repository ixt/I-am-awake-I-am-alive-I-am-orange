#!/bin/bash
# 2017-01-16 23:26:02
REPOS=( origin ff4500 github )
. torsocks on
git add README.md 2>/dev/null
git commit -sm "$(date -u +%Y-%m-%d\ %H:%M:%S)" 2>/dev/null
for i in "${REPOS[@]}"; do
    pkill gpg-agent
    gpg-agent --enable-ssh-support --daemon git push $i master
done
gpg -d tweet.sh.gpg > tweet.sh
while read entry; do
   ./tweet.sh "$(echo $entry | sed -s "s/# //g")"
done < README.md
COMMITID=$(git log -1 2>/dev/null | grep -i "commit" | sed -e "s/commit //g")
COMMITURL=$(echo "https://github.com/ixt/I-am-awake-I-am-alive-I-am-orange/commit/$COMMITID")
./tweet.sh "Verification: $COMMITURL"
echo "" > tweet.sh
. torsocks off 
