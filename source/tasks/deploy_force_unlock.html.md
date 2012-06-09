---
title: deploy:force_unlock
group: Deploy tasks
---

Removes the deploy lock file. If a deploy is terminated midway, it may leave a
lock file to signal that deploys shouldn't be made. This forces the removal of
that lock file.

    $ mina deploy
    -----> ERROR: another deployment is ongoing.
           Delete the lock file to continue.

    $ mina deploy:force_unlock
    -----> Unlocking
           $ rm /var/www/kickstack.me/deploy.lock

    $ mina deploy
    # ...The deploy should proceed now

This may be invoked in the command line or as a subtask.
