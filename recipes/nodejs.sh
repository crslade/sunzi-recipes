if aptitude search '~i ^nodejs$' | grep -q nodejs; then
  echo "nodejs already installed, skipping."
else
  add-apt-repository ppa:chris-lea/node.js --yes
  apt-get -y update
  apt-get -y install nodejs
  #service nginx start
fi