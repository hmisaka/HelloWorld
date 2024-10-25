chcp 65001
@echo off
cd D:\02_日常学习\HelloWorld
for /f "tokens=1-4 delims=/: " %%i in ("%date% %time%") do (
    set current_date=%%i-%%j-%%k_%%l
)
git add .
git commit -m "$current_date"
git push
echo complete
