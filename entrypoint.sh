#!/bin/bash

source activate dog-project 

KERAS_BACKEND=tensorflow python -c "from keras import backend" 
jupyter notebook /opt/dog_project/dog_app.ipynb --ip=0.0.0.0 --port=8080 --allow-root
