---
title: Command queue
order: 3
---

At the heart of it, Mina is merely sugar on top of Rake to queue commands
and execute them remotely at the end.

Take a look at this minimal *deploy.rb* configuration:

    set :user, 'john'
    set :domain, 'flipstack.com'

    task :logs do
      queue 'echo "Contents of the log file are as follows:"'
      queue "tail -f /var/log/apache.log"
    end

Once you type `mina logs` in your terminal, it invokes the *queue*d commands
remotely on the server using the command `ssh john@flipstack.com`.

    # Run it in simulation mode so we see the command it will invoke:
    $ mina logs --simulate
    (
      echo "Contents of the log file are as follows:"
      tail -f /var/log/apache.log
    ) | ssh john@flipstack.com -- bash -
