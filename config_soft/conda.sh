
# ==> /home/user/.condarc <==
#添加清华的源
conda config --add channels https://mirrors.tuna.tsinghua.edu.cn/anaconda/pkgs/free/
#中科大的源
conda config --add channels https://mirrors.ustc.edu.cn/anaconda/pkgs/free/ 
#阿里云的源
# conda config --add channels http://mirrors.aliyun.com/pypi/simple/

conda config --show-sources


#
# conda config --remove channels