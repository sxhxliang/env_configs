###
 # @Descripttion: https://github.com/AaronLeong/HoloCV
 # @version: 0.0.1
 # @Author: Shihua Liang (sxhx.liang@gmail.com)
 # @FilePath: /env_config/macos/homebrew_domain.sh
 # @Create: 2020-03-27 17:19:46
 # @LastAuthor: Shihua Liang
 # @lastTime: 2020-03-27 17:20:25
 ###

#替换homebrew默认源
cd "$(brew --repo)"
git remote set-url origin git://mirrors.ustc.edu.cn/brew.git
#替换homebrew-core源
cd "$(brew --repo)/Library/Taps/homebrew/homebrew-core"
git remote set-url origin git://mirrors.ustc.edu.cn/homebrew-core.git
# brew更新
brew update
# 设置 bintray镜像
echo 'export HOMEBREW_BOTTLE_DOMAIN=https://mirrors.ustc.edu.cn/homebrew-bottles' >> ~/.bash_profile
source ~/.bash_profile