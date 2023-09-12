#!/bin/bash

curl -fL https://github.com/coursier/coursier/releases/latest/download/cs-x86_64-pc-linux.gz | gzip -d > cs && chmod +x cs
./cs update
./cs install scala:$SCALA_VERSION 
./cs install scalac:$SCALA_VERSION
./cs install sbt

echo 'export PATH="$HOME/.local/share/coursier/bin:$PATH"' >> $HOME/.bashrc

source $HOME/.bashrc
