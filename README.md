# Server provisioning recipes

These recipes will provision a server for a Rails 4.1 app, using [Capistrano 3.1](http://capistranorb.com/), for deployment. It will install nginx, rbenv (and Ruby), node.js, and postgres. It also creates a deploy user, and sets up the environment for deployment.

This recipe installs ppa's to make sure apt installs the latest software. 

## Installation

You need [sunzi](https://github.com/kenn/sunzi).

    gem install sunzi

## Steps

1. Copy your ssh public key into `files/deploy_key`.
2. Edit `sunzi.yml` with your app name and postgres information.
3. Make sure it will setup things the way you want.
4. This script will setup postgres for password authentication, instead of authentication based on the machine's user.
5. Make sure you can ssh to your server with the root account. You might want to copy your ssh public key into /root/.ssh/authorized_keys, so you don't have to type the password.
6. `sunzi deploy [HOST/IP]`.

Next, you can follow a [guide](http://www.talkingquickly.co.uk/2014/01/deploying-rails-apps-to-a-vps-with-capistrano-v3/) by Ben Dixon on how to deploy your app using capistrano.

## Customization

The main script is `install.sh`. Here you can change which recipes will be run, do special stuff, etc.
The recipes reside in (surprise!) `recipes/`. You can add new ones if you like.
If you want to know more (attribute variable usage, etc.) consult the [sunzi documentation](https://github.com/kenn/sunzi#readme).