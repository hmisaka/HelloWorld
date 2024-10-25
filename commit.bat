chcp 65001
@echo off
cd D:\02_日常学习\HelloWorld
echo "请输入提交信息："
read message
git add .
git commit -m "$message"
git push
echo complete
