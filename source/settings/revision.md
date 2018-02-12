---
title: revision
group: Git settings
brief: A commitish reference to the commit to be deployed.
---

A commitish reference to the commit to be deployed. It can be a SHA1 hash, a
tag, or a branch.

    # config/deploy.rb
    require 'mina/git'

    set :repository, 'https://github.com/you/your-app.git'
    set :deploy_to, '/var/www/flipstack.me'
    set :commit, '46f2d834021914d529c8aa471a7ce7be6574c983'  # Optional

Optional. This option is only relevant when you load the Git addon using
`require 'mina/git'`.

See [git:clone](../tasks/git_clone.html) for more information.
