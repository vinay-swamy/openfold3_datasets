#!/bin/bash 
mamba create -y --prefix $MAMBA_ROOT_PREFIX/of3ds python=3.11.5 numpy==1.26.0
mamba activate $MAMBA_ROOT_PREFIX/of3ds
mamba install -y ipykernel
pip install git+https://github.com/rcsb/py-rcsbsearchapi.git

