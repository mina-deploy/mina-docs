---
title: deploy:cleanup
group: Deploy tasks
brief: Clean up old releases.
---

Clean up old releases. By default, the last 5 releases are kept on
each server (though you can change this with the keep_releases setting).
All other deployed revisions are removed from the servers.

    $ mina deploy:cleanup
    -----> Cleaning up old releases (keeping 5)

This may be invoked in the command line or as a subtask.