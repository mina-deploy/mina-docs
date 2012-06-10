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
    set :revision, 'master'  # Optional

Optional. This option is only relevant when you load the Git addon using
`require 'mina/git'`.

See [git:clone](../tasks/git_clone.html) for more information.
