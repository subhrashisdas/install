# Install node.js

NODE_VERSION=13.10.1;
mkdir -p ~/lib/node
curl https://nodejs.org/dist/v$NODE_VERSION/node-v$NODE_VERSION-linux-x64.tar.xz | tar --strip-components=1 -xJvf - -C ~/lib/node
echo 'export PATH=~/lib/node/bin:$PATH' >> ~/.profile
