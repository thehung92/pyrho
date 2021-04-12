#
docker run --name pyrho -it continuumio/miniconda3:latest
# inside
conda create -y -n my-pyrho-env
conda activate my-pyrho-env
mkdir -p /root/Tools && cd /root/Tools
git clone https://github.com/popgenmethods/ldpop.git ldpop && pip install ldpop/
# install from conda
conda install -y -c conda-forge msprime
#

apt-get update && apt-get install -y libssl-dev
pip install cython

git clone https://github.com/popgenmethods/pyrho.git pyrho && \
    pip install pyrho/ # error in this step

# build image from dockerfile
cat Dockerfile | docker build - -t thehung92phuyen/pyrho:v1.1
# test
docker run -it thehung92phuyen/pyrho:v1.1 bash
# test pyrho
python -m pytest /root/Tools/pyrho/tests/tests.py