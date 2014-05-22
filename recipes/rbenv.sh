# rbenv
# $1: ruby version

if [ -d /usr/local/rbenv ]; then
  echo 'rbenv already installed, skipping.'
else
  git clone git://github.com/sstephenson/rbenv.git /usr/local/rbenv
  echo 'export RBENV_ROOT=/usr/local/rbenv' >> /etc/profile.d/rbenv.sh
  echo 'export PATH="$RBENV_ROOT/bin:$PATH"' >> /etc/profile.d/rbenv.sh
  echo 'eval "$(rbenv init -)"' >> /etc/profile.d/rbenv.sh
  chmod +x /etc/profile.d/rbenv.sh
  source /etc/profile.d/rbenv.sh
  pushd /tmp
    git clone git://github.com/sstephenson/ruby-build.git
    cd ruby-build
    ./install.sh
  popd
  echo "Compiling Ruby. Grab some hot chocolate, this will take a while..."
  rbenv install $1
  rbenv global $1
  gem install bundler --no-ri --no-rdoc
  rbenv rehash
fi