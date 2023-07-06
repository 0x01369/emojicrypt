#!/bin/bash

# Install pip
curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
python get-pip.py

# Install required packages using pip
pip install art
pip install text2art

# Install required packages using apt
sudo apt update
sudo apt bash
sudo apt install -y toilet figlet

echo "Installation complete!"
