#setup ufw

#ufw installed by nginx dependency

if ufw status | grep -q 'Status: active'; then
  echo "ufw already configured, skipping."
else
	ufw allow ssh #to make sure ssh connection is not dropped
 	ufw --force enable
 	ufw allow ssh
 	ufw allow http
 	#uncomment the following line to allow https connections
 	#ufw allow https 
fi