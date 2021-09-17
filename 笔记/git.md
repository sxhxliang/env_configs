Git - grafted 和 shallow update not allowed
一般人对开源的模板进行修改是总会进行这样的一条龙操作

# 克隆最近一次提交
git clone xxx --depth 1
# 修改修改修改 提交提交提交
vim xxx
git commit -am "First commit"
vim xxx
git commit -am "xxx complete"
# 将源更换为自己新建的仓库
git remote set-rul origin xxx
# 推上去（这步会报错 shallow update not allowed ）
git push -u origin master
报错 shallow update not allowed ！？
为什么会变成这样呢…… 第一次，有了合适的模板；第一次觉得这个一套下来自己很 6。这两件愉快的事情交织在了一起。而这两份喜悦，又会给我带来许许多多的喜悦。我本应该获得了这种如梦一般的幸福时光才对。可是，为什么，为什么最后一步会报错呢……

其实这个错有比较简单的方法直接删掉.git目录重新 init 就好。。

然而我们如果已经提交了几次并且不想丢失这些提交可以使用 git filter-branch -- --all 

(pytorch) ➜  shdet git:(main) git filter-branch -- --all
warning: ignoring broken ref refs/remotes/origin/HEAD
Rewrite fa16d254c7544ddcd3012d48c7573cddc725a2a5 (235/260) (2 seconds passed, remaining 0 predicted)
Ref 'refs/heads/main' was rewritten
Ref 'refs/stash' was rewritten
WARNING: Ref 'refs/tags/v0.0.1' is unchanged
Ref 'refs/tags/v0.1.0' was rewritten
Ref 'refs/tags/v0.2.0' was rewritten
Ref 'refs/tags/v0.3.0' was rewritten
Ref 'refs/tags/v0.4.0' was rewritten
Ref 'refs/tags/v0.4.1' was rewritten
Ref 'refs/tags/v0.4.2' was rewritten
(pytorch) ➜  shdet git:(main) git push -u origin main

这样就可以去掉克隆的提交的 grafted 标记了，然后愉快地进行 git push -u origin master 了。

更详细的内容就查看参考和文档吧。Git 真是厉害啊！