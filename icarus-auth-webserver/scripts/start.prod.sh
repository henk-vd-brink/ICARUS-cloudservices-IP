#!/bin/bash

python3 src/manage.py migrate
python3 src/manage.py collectstatic --no-input
python3 src/manage.py runserver 0.0.0.0:8000