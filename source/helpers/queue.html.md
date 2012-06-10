---
title: queue
group: Helpers
---

This queues code to be ran to the current code bucket (defaults to `:default`).
At the end of the execution, before Mina exits, all queued commands are executed
remotely.

    # .rb
    task :restart do
      queue "touch #{deploy_to}/tmp/restart.txt"
    end

    # The command will be executed on `mina restart`

### Checking queued commands

To get the things that have been queued, use `commands[:default]`. See
[#commands](commands.html) for more info.

    # .rb
    queue "sudo restart"
    queue "true"

    commands == ['sudo restart', 'true']
