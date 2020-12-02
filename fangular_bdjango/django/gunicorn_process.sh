#!/bin/bash

cd /var/www/html/LendingAlly/
source venv/bin/activate  #assuming you use virtualenv
cd lendingbackend
#workon your_env_name # if you do not use virtualenv, remove this line the line above
gunicorn --bind 0.0.0.0:7000 --workers=9 --threads=9 LendingAlly.wsgi:application 
