---
title: repository
group: Git settings
brief: The URL for the repository.
---

The URL for the repository.
**Required** when you use `require 'mina/git'`.

    # config/deploy.rb
    require 'mina/git'

    set :repository, 'https://github.com/you/your-app.git'
    set :revision, 'master'  # Optional

See [git:clone](../tasks/git_clone.html) for more information.
