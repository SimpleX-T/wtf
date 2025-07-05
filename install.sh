#!/bin/bash

echo "📦 Installing 'wtf' CLI..."

# Clone the repo to a temp directory
git clone https://github.com/SimpleX-T/wtf.git /tmp/wtf-cli

cd /tmp/wtf-cli

# Make it executable and move to /usr/local/bin
chmod +x wtf
sudo cp wtf /usr/local/bin/wtf

echo "✅ 'wtf' installed successfully!"
echo "➡️  You can now run it like: wtf filename.txt 'your text'"
