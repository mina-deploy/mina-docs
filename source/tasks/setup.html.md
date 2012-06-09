---
title: setup
group: Deploy tasks
---

Prepares the `deploy_to` directory for deployments. Sets up subdirectories and
sets permissions in the path.

    $ mina setup
    -----> Setting up
           $ mkdir -p /var/www/kickstack.me
           $ chmod g+r,a+rwx /var/www/kickstack.me
           $ mkdir -p /var/www/kickstack.me/releases
           $ mkdir -p /var/www/kickstack.me/shared
           ...
