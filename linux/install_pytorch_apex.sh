# https://github.com/NVIDIA/apex/issues/86
pip uninstall apex
cd ~/apex
rm -rf build
python setup.py install --cuda_ext --cpp_ext
cd -