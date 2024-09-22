chcp 65001
@echo off
cd D:\02_日常学习\HelloWorld
git add .
git commit -m "$(date +'%Y-%m-%d')"
git push
echo complete
