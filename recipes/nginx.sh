if aptitude search '~i ^nginx$' | grep -q nginx; then
  echo "nginx already installed, skipping."
else
  add-apt-repository ppa:nginx/stable --yes
  apt-get -y update
  apt-get -y install nginx
  #service nginx start
fi