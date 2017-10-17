#!/usr/bin/env bash
# 2017-10-17 23:24:45
cd $(dirname $0)
git add README.md 
git commit -sm "$(date -u +%Y-%m-%d\ %H:%M:%S)"
for r in $(git remote); do git push $r master; done
gpg2 --card-status 
gpg2 -d tweet.sh.gpg > tweet.sh
chmod +x tweet.sh
while read entry; do
   ./tweet.sh "$(echo $entry | sed -s "s/# //g")"
done < README.md
COMMITID=$(git log -1 2>/dev/null | grep -i "commit" | sed -e "s/commit //g")
COMMITURL=$(echo "https://github.com/ixt/I-am-awake-I-am-alive-I-am-orange/commit/$COMMITID")
#./tweet.sh "Verification: $COMMITURL"
#rm ./tweet.sh
cd -
