#FROM nvidia/cuda:10.0-cudnn7-runtime
FROM nvidia/cuda:9.0-cudnn7-runtime


ARG PYTHON_VERSION=3.6
ARG CONDA_VERSION=3
ARG CONDA_PY_VERSION=4.5.11

RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
    python3-pip python3-dev wget gcc g++ make cmake libglib2.0-0 libsm6  libxext6 \
    libxrender-dev\
        bzip2 libopenblas-dev pbzip2 libgl1-mesa-glx && \
            apt-get clean && \
                rm -rf /var/lib/apt/lists/*

# INSTALLATION OF CONDA
ENV PATH /opt/conda/bin:$PATH
COPY ./miniconda.sh /opt/
RUN  /bin/bash /opt/miniconda.sh -b -p /opt/conda && \
     rm /opt/miniconda.sh && \
         /opt/conda/bin/conda clean -tipsy && \
             ln -s /opt/conda/etc/profile.d/conda.sh /etc/profile.d/conda.sh && \
                 echo “. /opt/conda/etc/profile.d/conda.sh” >> ~/.bashrc && \
                     echo “conda activate base” >> ~/.bashrc


RUN mkdir /opt/dog_project
COPY ./ /opt/dog_project
#COPY ./sources.list /etc/apt
#RUN apt update -y --fix-missing
#RUN apt install -y cmake
RUN chmod +x /opt/dog_project/entrypoint.sh
RUN conda env create -f /opt/dog_project/requirements/dog-linux-gpu.yml

EXPOSE 8080

ENTRYPOINT '/opt/dog_project/entrypoint.sh'

#docker run --gpus all -p 8080:8080 -v
#/media/neo/dump/images/dogImages/:/opt/dog_project/dogImages -v
#/media/neo/dump/lfw/:/opt/dog_project/lfw -v
#/media/neo/dump/dog_project/.ipynb_checkpoints/:/opt/dog_project/.ipynb_checkpoints
#-v /media/neo/dump/dog_project/saved_models/:/opt/dog_project/saved_models -v
#/media/neo/dump/dog_project/images/:/opt/dog_project/images rojas/dog_project
