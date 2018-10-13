#!/bin/bash

source ${CESI_HOME}/venv/bin/activate
python3 ${CESI_HOME}/cesi/run.py --config-file ${CESI_HOME}/defaults/cesi.conf
