---
title: user
group: SSH settings
brief: Username to connect to SSH with. Optional.
---

Username to connect to SSH with. Optional.

    # config/deploy.rb
    set :domain, 'flipstack.me'
    set :user, 'flipstack_www'                # Optional
    set :identity_file, 'keys/deploy.pem'     # Optional

    # This will invoke SSH sessions with:
    # $ ssh flipstack_www@flipstack.me -i keys/deploypem
