---
title: port
group: SSH settings
brief: The SSH port number to connect to. Optional.
---

The SSH port number to connect to. Optional.

    # config/deploy.rb
    set :domain, 'flipstack.me'
    set :port, 30000

    # This will invoke SSH sessions with:
    # $ ssh flipstack_www@flipstack.me -p 30000
