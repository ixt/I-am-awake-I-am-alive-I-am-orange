#!/bin/bash
# 2016-10-30 12:00:15
git add README.md
git commit -sm "$(date -u +%Y-%m-%d\ %H:%M:%S)"
git push origin master
