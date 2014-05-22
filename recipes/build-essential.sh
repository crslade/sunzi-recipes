if aptitude search '~i ^build-essential$' | grep -q build-essential; then
  echo 'requirements already installed, skipping.'
else
  apt-get -y install build-essential zlib1g-dev libssl-dev libreadline-dev libcurl4-openssl-dev
fi