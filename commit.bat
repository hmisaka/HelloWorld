REM commit msg:
set /p commitMessage: 

git add .

git commit -m "%commitMessage%"

git push

echo complete
