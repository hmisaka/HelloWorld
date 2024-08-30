# 本地项目上传GitHub

git下载地址：https://git-scm.com/downloads

## 一、流程

- 首先先在Github中创建远程仓库（项目）
- 然后准备好本地项目
- 最后通过Git命令进行本地项目和远程仓库关联、推送等操作

## 二、创建远程仓库

GitHub创建远程仓库，名字最好和项目名称一致。

复制远程仓库地址（SSH或HTTPS）

SSH和HTTPS的区别在于SSH需要配置SSH Key（无需账号密码验证），HTTPS则无需配置SSH KEY（拉取推送时需要用户和密码验证）

## 三、本地项目上传到GitHub

### 1.初始化

初始化时，确保本地分支和远程仓库分支名称一致。如果远程仓库分支为main，初始化本地仓库，同时指定默认分支为main，与远程仓库的main保持一致。

```shell
git init -b main
```

### 2.关联远程仓库

```shell
git remote add origin 远程仓库地址
```

### 3.拉取远程仓库文件到本地

```shell
git pull origin main
```

### 4.将本地文件添加到暂存区

```shell
git add .
```

### 5.暂存区提交到仓库区

```shell
git commit -am "提交时的描述信息，如提交了哪些内容"
```

### 6.文件推送到远程仓库

```shell
git push origin main
```

