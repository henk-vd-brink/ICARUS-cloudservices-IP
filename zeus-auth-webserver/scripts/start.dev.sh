#!/bin/bash

python3 ${HOME}/src/manage.py migrate
python3 ${HOME}/src/manage.py collectstatic --no-input
python3 ${HOME}/src/manage.py runserver 0.0.0.0:8000