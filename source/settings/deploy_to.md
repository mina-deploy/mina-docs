---
title: deploy_to
group: Deploy settings
brief: Path to deploy to. Required.
---

Path to deploy to. *Required.*

    # config/deploy.rb
    set :deploy_to, '/var/www/flipstack.me'
    set :releases_path, 'releases'
    set :shared_path, 'shared'
    set :current_path, 'current'
    set :lock_file, 'deploy.lock'
    
    # This means the following paths will be
    # created on `mina setup`:
    #    /var/www/flipstack.me/
    #    /var/www/flipstack.me/releases/
    #    /var/www/flipstack.me/shared/
