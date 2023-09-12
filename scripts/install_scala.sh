#!/bin/sh

curl -fL https://github.com/coursier/coursier/releases/latest/download/cs-x86_64-pc-linux.gz | gzip -d > cs && chmod +x cs
echo "Installing Scala $SCALA_VERSION"
./cs install scala:$SCALA_VERSION 
echo "Installing Scalac $SCALA_VERSION"
./cs install scalac:$SCALA_VERSION
echo "Installing sbt"
./cs install sbt

echo 'export PATH="$HOME/.local/share/coursier/bin:$PATH"' >> $HOME/.bashrc

sbt new scala/hello-world.g8
cd scala/hello-world.g8
sbt compile