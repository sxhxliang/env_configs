###
 # @Descripttion: https://github.com/AaronLeong/HoloCV
 # @version: 0.0.1
 # @Author: Shihua Liang (sxhx.liang@gmail.com)
 # @FilePath: /env_config/macos/sign_app.sh
 # @Create: 2020-03-27 17:06:09
 # @LastAuthor: Shihua Liang
 # @lastTime: 2020-03-27 17:06:21
 ###

# Bartender\ 3.app打不开，重新签名
codesign --force --deep --sign - /Applications/Bartender\ 3.app