---
title: domain
group: SSH settings
brief: Hostname to SSH to. Required.
---

Hostname to SSH to. *Required.*

    # config/deploy.rb
    set :domain, 'flipstack.me'
    set :user, 'flipstack_www'                # Optional
    set :identity_file, 'keys/deploy.pem'     # Optional
    set :port, 30000                          # Optional

    # This will invoke SSH sessions with:
    # $ ssh flipstack_www@flipstack.me -i keys/deploypem -p 30000
