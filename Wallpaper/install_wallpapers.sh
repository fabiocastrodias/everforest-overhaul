#!/bin/bash

sh .cfg/create_crontab.sh

wget -i .cfg/imgs_url.txt

python3 .cfg/rename.py
