@echo off
REM 脚本将进行以下操作：添加更改、提交更改、推送到远程仓库

REM 设置 Git 提交信息
set /p commitMessage=请输入提交信息： 

REM 添加所有更改
git add .

REM 提交更改
git commit -m "%commitMessage%"

REM 推送到默认的远程仓库
git push

REM 打印完成消息
echo 提交已完成！
pause
