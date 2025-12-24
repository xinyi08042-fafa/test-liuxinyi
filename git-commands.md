# git常用命令手册

## 一、基础操作

### 1.1 初始化仓库

# 在当前目录创建新的Git仓库
git init

# 初始化并指定仓库名
git init 项目名

# 克隆远程仓库（HTTPS方式）
git clone https://github.com/用户名/仓库名.git

# 克隆远程仓库（SSH方式）
git clone git@github.com:用户名/仓库名.git

# 克隆指定分支
git clone -b 分支名 仓库地址

## 1.2 查看状态

# 查看仓库状态
git status

# 简洁模式显示
git status -s

# 查看忽略的文件
git status --ignored

## 二、分支管理

### 2.1分支操作
# 查看所有本地分支
git branch

# 查看所有分支（包括远程）
git branch -a

# 查看已合并的分支
git branch --merged

# 查看未合并的分支
git branch --no-merged

# 创建新分支
git branch 分支名

# 创建并切换到新分支
git checkout -b 分支名
# 或（Git 2.23+）
git switch -c 分支名

# 切换到已有分支
git checkout 分支名
git switch 分支名

# 重命名当前分支
git branch -m 新分支名

# 删除本地分支
git branch -d 分支名     # 安全删除（已合并）
git branch -D 分支名     # 强制删除（未合并）

### 2.2
# 合并指定分支到当前分支
git merge 分支名

# 使用快进模式合并
git merge --ff-only 分支名

# 变基（重写提交历史）
git rebase 分支名

# 交互式变基（最近3次提交）
git rebase -i HEAD~3

# 取消合并/变基
git merge --abort
git rebase --abort

## 三、提交操作

### 3.1添加文件
# 添加单个文件
git add 文件名

# 添加所有修改的文件
git add .

# 添加所有修改和删除的文件（不包括新文件）
git add -u

# 添加所有文件（包括新文件）
git add -A

# 交互式添加
git add -i

# 添加某个目录
git add 目录名/

### 3.2 提交更改
# 提交已暂存的更改
git commit -m "提交说明"

# 提交并添加描述（打开编辑器）
git commit

# 修改最后一次提交信息
git commit --amend -m "新提交信息"

# 修改最后一次提交的文件内容
git add 修改的文件
git commit --amend --no-edit

# 跳过暂存区直接提交
git commit -a -m "提交说明"

### 3.3 删除文件
# 删除文件并暂存删除操作
git rm 文件名

# 删除文件但保留在本地
git rm --cached 文件名

# 删除目录
git rm -r 目录名

## 四、远程操作

### 4.1远程仓库配置
# 查看远程仓库
git remote -v

# 添加远程仓库
git remote add origin 仓库地址

# 修改远程仓库地址
git remote set-url origin 新地址

# 删除远程仓库
git remote remove origin

# 查看远程仓库详情
git remote show origin

### 4.2推送与拉取
# 推送到远程分支
git push origin 分支名

# 推送并设置上游分支
git push -u origin 分支名

# 强制推送（谨慎使用）
git push origin 分支名 --force
git push origin 分支名 -f

# 拉取远程分支
git pull origin 分支名

# 拉取并变基
git pull --rebase origin 分支名

# 仅获取远程更新（不合并）
git fetch origin

# 获取并清理已删除的远程分支
git fetch --prune

### 4.3远程分支管理
# 创建本地分支跟踪远程分支
git checkout -b 本地分支名 origin/远程分支名

# 删除远程分支
git push origin --delete 分支名
git push origin :分支名     # 旧语法

# 推送所有标签
git push origin --tags

# 删除远程标签
git push origin --delete tag 标签名

## 五、撤销与恢复

### 5.1撤销工作区修改
# 撤销工作区的修改（未暂存）
git checkout -- 文件名

# 撤销所有工作区修改
git checkout -- .

# 恢复文件到指定提交版本
git checkout 提交ID -- 文件名

### 5.2撤销暂存区修改
# 从暂存区移除文件（保留工作区修改）
git restore --staged 文件名
git reset HEAD 文件名       # 旧命令

# 移除所有暂存文件
git restore --staged .

### 5.3撤销提交
# 撤销最近一次提交（保留修改）
git reset --soft HEAD~1

# 撤销最近一次提交（不保留修改）
git reset --hard HEAD~1

# 撤销到指定提交
git reset --hard 提交ID

# 创建撤销提交（保留历史）
git revert 提交ID

# 撤销多个提交
git revert HEAD~3..HEAD

### 5.4暂存修改
# 暂存当前修改
git stash

# 暂存并添加描述
git stash save "描述信息"

# 查看暂存列表
git stash list

# 恢复最近暂存的修改
git stash pop

# 恢复指定暂存
git stash apply stash@{n}

# 删除暂存
git stash drop stash@{n}

# 清空所有暂存
git stash clear

###
