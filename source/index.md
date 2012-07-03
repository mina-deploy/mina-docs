---
title: Mina
order: 0
brief: Really fast deployer and server automation tool
---

Mina lets you build and run scripts to manage your app deployments on servers
via SSH.

    $ gem install mina
    $ mina

Really bloody fast
------------------

Mina works really fast because it's a deploy Bash script generator. It
generates an entire procedure as a Bash script and runs it remotely in the
server.

    $ mina deploy --verbose

    -----> Creating the build path
           $ mkdir tmp/build-128293482394
    -----> Cloning the Git repository
           $ git clone https://github.com/nadarei/flipstack.git . -n --recursive
           Cloning... done.
    -----> Installing gem dependencies using Bundler
           $ bundle install --without development:test
           Using i18n (0.6.0)
           Using multi_json (1.0.4)
           ...
           Your bundle is complete! It was installed to ./vendor/bundle
    -----> Moving to releases/4
           $ mv "./tmp/build-128293482394" "releases/4"
    -----> Symlinking to current
           $ ln -nfs releases/4 current
    -----> Launching
           $ cd releases/4
           $ sudo service nginx restart
    -----> Done. Deployed v4

Compare this to the likes of Vlad or Capistrano, where each command
is ran separately on their own SSH sessions. Mina only creates *one* SSH
session per deploy, minimizing the SSH connection overhead.

See [the deploying guide](deploying.html) for more information.

Incredibly customizable
-----------------------

All your settings are stored in a Ruby file
[config/deploy.rb](about_deploy_rb.html).

    # config/deploy.rb
    require 'mina/git'
    require 'mina/bundler'

    set :domain, 'your.server.com'
    set :user, 'flipstack'
    set :repository, 'flipstack'

    task :deploy do
      deploy do
        # Preparations here
        invoke :'git:clone'
        invoke :'bundle:install'
      end
    end

    task :restart do
      queue 'sudo service restart apache'
    end

In this file, you will define tasks that *queue* up commands to be ran
remotely via SSH.

Mina is built on [Rake](http://http://rake.rubyforge.org/). Mina configuration
files are simply Rake files.

See [About deploy.rb](about_deploy_rb.html) for more information on
configuration.

More features
-------------

* __Safe deploys.__ New releases are built on a temp folder. If the deploy
  script fails at any point, the build is deleted and it'd be as if nothing
  happened.

* __Locks.__ Deploy scripts rely on a lockfile ensuring only one deploy can
  happen at a time.

* __Works with anything.__ While Mina is built with Rails projects it
  mind, it can be used on just about any type of project deployable via SSH,
  Ruby or not.

* __Built with Rake.__ Setting up tasks will be very familiar! No YAML files
  here. Everything is written in Ruby, giving you the power to be as flexible in
  your configuration as needed.

