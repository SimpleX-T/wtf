#!/bin/bash
# Simple installer for 'wtf'

set -e

echo "Installing 'wtf' CLI..."

chmod +x wtf
sudo cp wtf /usr/local/bin/

echo "Installed! Now you can run: wtf"
