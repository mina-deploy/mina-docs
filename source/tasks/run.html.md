---
title: run
group: Deploy tasks
---

Runs a command in the `deploy_to` path.

    $ mina run[ls]
  
### Running commands with spaces

To run commands with spaces, be sure to quotify the `run[...]` argument.

    $ mina "run[tail -f shared/logs/error.log]"
