FROM docker.io/mambaorg/micromamba:latest
ADD environment.yml /etc/environment/environment.yml
RUN micromamba install -y -n base -f /etc/environment/environment.yml && \
    micromamba clean --all -f -y
RUN micromamba shell init -s bash -p /opt/conda