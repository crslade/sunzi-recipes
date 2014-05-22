#set up rails specific environment variables
DEPLOY_HOME_PATH=/home/<%= @attributes.deploy_user%>
DEPLOY_ENV_FILE_PATH=$DEPLOY_HOME_PATH/.<%= @attributes.app_name %>_env
if [ -e $DEPLOY_ENV_FILE_PATH ]; then
  echo "env already set, skipping."
else

	mv files/env_vars $DEPLOY_ENV_FILE_PATH 
	chown <%= @attributes.deploy_user%>:<%= @attributes.deploy_user%> $DEPLOY_ENV_FILE_PATH 
	chmod 600 $DEPLOY_ENV_FILE_PATH 
	echo "source ~/.<%= @attributes.app_name %>_env" >> $DEPLOY_HOME_PATH/.bashrc
fi