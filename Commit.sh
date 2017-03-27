#!/usr/bin/env bash
# 2017-03-27 21:34:14
git add README.md 2>/dev/null
git commit -sm "$(date -u +%Y-%m-%d\ %H:%M:%S)" 2>/dev/null
for r in $(git remote); do git push $r master; done
gpg --card-status 2>/dev/null
gpg -d tweet.sh.gpg > tweet.sh
chmod +x tweet.sh
while read entry; do
   ./tweet.sh "$(echo $entry | sed -s "s/# //g")"
done < README.md
COMMITID=$(git log -1 2>/dev/null | grep -i "commit" | sed -e "s/commit //g")
COMMITURL=$(echo "https://github.com/ixt/I-am-awake-I-am-alive-I-am-orange/commit/$COMMITID")
./tweet.sh "Verification: $COMMITURL"
rm ./tweet.sh
