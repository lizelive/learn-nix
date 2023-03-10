pip3 install numpy --pre torch --force-reinstall --extra-index-url https://download.pytorch.org/whl/nightly/cu118 transformers diffusers accelerate scipy safetensors







docker run --gpus all -it --rm ghcr.io/pytorch/pytorch-nightly:latest /bin/bash