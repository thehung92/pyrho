FROM continuumio/miniconda3:latest
LABEL MAINTAINER="thehung, thehung92phuyen@gmail.com"
# create virtual environment and install dependencies using conda
WORKDIR /root/Tools/
RUN conda create -y --name pyrho
# make RUN commands use the new environment
SHELL ["conda", "run", "-n", "pyrho", "/bin/bash", "-c"]
# RUN in the new environment
RUN conda install -y -c conda-forge msprime && \
    apt-get update && apt-get install -y libssl-dev && \
    pip install cython && \
    git clone https://github.com/popgenmethods/ldpop.git ldpop && \
    pip install ldpop/ && \
    git clone https://github.com/popgenmethods/pyrho.git pyrho && \
    pip install pyrho/
# make bash start from pyrho env
RUN conda init && \
    echo "conda activate pyrho" >> ~/.bashrc