# pip install git+https://github.com/mapillary/inplace_abn.git@v1.0.11
# Note that some parts of InPlace-ABN have native C++/CUDA implementations, meaning that the command above will need to compile them.

# Alternatively, to download and install the latest version of our library, also obtaining a copy of the Imagenet / Vistas scripts:

git clone https://github.com/mapillary/inplace_abn.git --dept 1 ~/inplace_abn
cd ~/inplace_abn
python setup.py install
# cd scripts
# pip install -r requirements.txt

cd -