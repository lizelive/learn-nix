# conda install -n base conda-libmamba-solver
# conda config --set solver libmamba

export ENV_NAME=mlws7
conda env create --file $ENV_NAME.yml --force
conda run -n $ENV_NAME python ../../hf-test.py 