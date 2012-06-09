---
title: identity_file
group: SSH
brief: Local path to the SSH key to use. Optional.
---

Local path to the SSH key to use. Optional.

    # config/deploy.rb
    set :domain, 'flipstack.me'
    set :user, 'flipstack_www'                # Optional
    set :identity_file, 'keys/deploy.pem'     # Optional

    # This will invoke SSH sessions with:
    # $ ssh flipstack_www@flipstack.me -i keys/deploypem
