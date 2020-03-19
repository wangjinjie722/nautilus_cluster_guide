#!/usr/bin/env bash
nvidia-smi
conda env create -f environment.yml
source activate kw
pip install numpy
pip install tensorboardX
pip install h5py
python trainer_progressive_siamese.py
