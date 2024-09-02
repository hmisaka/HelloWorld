set -ex

git pull origin master
git add .
git commit -am %date%
git push origin master

