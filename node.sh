# Install node.js

NODE_VERSION=15.1.0;
rm -rf ~/lib/node;
mkdir -p ~/lib/node;
curl https://nodejs.org/dist/v$NODE_VERSION/node-v$NODE_VERSION-linux-x64.tar.xz | tar --strip-components=1 -xJvf - -C ~/lib/node;
echo 'export PATH=~/lib/node/bin:$PATH' >> ~/.profile;
