# Install java

mkdir -p ~/lib/java
curl https://download.java.net/java/GA/jdk13.0.2/d4173c853231432d94f001e99d882ca7/8/GPL/openjdk-13.0.2_linux-x64_bin.tar.gz | tar --strip-components=1 -xvzf - -C ~/lib/java
echo 'export PATH=~/lib/java/bin:$PATH' >> ~/.profile
