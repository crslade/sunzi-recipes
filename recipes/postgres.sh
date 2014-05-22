# postgresql

if aptitude search '~i ^postgresql$' | grep -q postgresql; then
  echo "postgresql already installed, skipping."
else
  echo "deb http://apt.postgresql.org/pub/repos/apt/ trusty-pgdg main" >> /etc/apt/sources.list.d/postgresql-pgdgp-trusty.list
  wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add -
  apt-get update
  apt-get -y install postgresql libpq-dev

   #enable password authentication
   mv files/pg_hba.conf /etc/postgresql/<%= @attributes.postgres_version %>/main/pg_hba.conf
   chown postgres:postgres /etc/postgresql/<%= @attributes.postgres_version %>/main/pg_hba.conf
   chmod 640 /etc/postgresql/<%= @attributes.postgres_version %>/main/pg_hba.conf
   sudo service postgresql restart

  #create user and database
  sudo -u postgres psql -c "create user <%= @attributes.postgres_user %> with password '<%= @attributes.postgres_password %>';"
  sudo -u postgres psql -c "create database <%= @attributes.postgres_database %> owner <%= @attributes.postgres_user %>;"
fi