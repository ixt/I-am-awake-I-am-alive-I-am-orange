#!/bin/bash
# 2017-01-13 02:41:51
git add README.md
git commit -sm "$(date -u +%Y-%m-%d\ %H:%M:%S)"
git push origin master
git push ff4500 master
gpg -d twitter.rb.gpg > twitter.rb
while read entry; do
   ./twitter.rb "$(echo $entry | sed -s "s/# //g")"
done < README.md
COMMITID=$(git log -1 | grep -i "commit" | sed -e "s/commit //g")
COMMITURL=$(echo "https://github.com/ixt/I-am-awake-I-am-alive-I-am-orange/commit/$COMMITID")
./twitter.rb "Verification: $COMMITURL"
