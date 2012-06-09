---
title: Setting up a project
order: 1
---

Let's deploy a project using Mina.

### Step 1: Create a config/deploy.rb

In your project, type `mina init` to create a sample of this file.

    $ mina init
    Created config/deploy.rb.

This is just a Rake file with tasks! See [About deploy.rb](#about_deployrb) for 
more info on what *deploy.rb* is.

### Step 2: Set up your server

Make a directory in your server called `/var/www/flipstack.com` (in *deploy_to*)
change it's ownership to the correct user.

    # SSH into your server, then:
    $ mkdir /var/www/flipstack.com
    $ chown -R username /var/www/flipstack.com

    # Make sure 'username' is the same as what's on deploy.rb

### Step 3: Run 'mina setup'

Now do `mina setup` to set up the [folder structure](#directory_structure) in this
path. This will connect to your server via SSH and create the right directories.

    $ mina setup
    -----> Creating folders... done.

See [directory structure](#directory_structure) for more info.

### Step 4: Deploy!

Use `mina deploy` to run the `deploy` task defined in *config/deploy.rb*.

    $ mina deploy
    -----> Deploying to 2012-06-12-040248
           ...
           Lots of things happening...
           ...
    -----> Done.
