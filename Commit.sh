#!/bin/bash
# 2017-01-16 23:26:02
. torsocks on
git add README.md
git commit -sm "$(date -u +%Y-%m-%d\ %H:%M:%S)"
git push origin master
git push ff4500 master
gpg -d tweet.sh.gpg > tweet.sh
while read entry; do
   ./tweet.sh "$(echo $entry | sed -s "s/# //g")"
done < README.md
COMMITID=$(git log -1 | grep -i "commit" | sed -e "s/commit //g")
COMMITURL=$(echo "https://github.com/ixt/I-am-awake-I-am-alive-I-am-orange/commit/$COMMITID")
./tweet.sh "Verification: $COMMITURL"
echo "" > tweet.sh
. torsocks off 
