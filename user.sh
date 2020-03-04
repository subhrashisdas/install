sudo useradd -m -s /bin/bash hasura

# usermod -aG sudo sammy

# Give non sudo privilege to hasura
sudo usermod -a -G docker hasura
