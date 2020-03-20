#!/usr/bin/env bash
#nvidia-smi
conda env create environment.yml
source activate kw
pip install numpy
pip install tensorboardX
pip install h5py
python2 main.py --input_streams sub
