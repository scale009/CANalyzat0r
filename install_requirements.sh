#!/bin/bash

set -o pipefail

# The dir of the start script (this file)
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

export LC_ALL=C.UTF-8
export LANG=C.UTF-8

# Apt dependencies
sudo apt update
sudo apt -y install \
   can-utils \
   ffmpeg \
   git \
   iproute2 \
   python3-pip \


# Pip dependencies
sudo pip3 install --upgrade pip
sudo pip3 install pipenv

# Create a new pipenv
cd $DIR
mkdir -p pipenv && cd pipenv
pipenv --three

pipenv install python-can
pipenv install sphinx_rtd_theme
pipenv install pyside2
