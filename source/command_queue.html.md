---
title: Command queue
order: 3
group: Getting started
---

At the heart of it, Mina is merely sugar on top of Rake to queue commands
and execute them remotely at the end. Take a look at this minimal *deploy.rb*
configuration:

    set :user, 'john'
    set :domain, 'flipstack.com'

    task :logs do
      queue 'echo "Contents of the log file are as follows:"'
      queue "tail -f /var/log/apache.log"
    end

<br clear='both' />

Once you type `mina logs` in your terminal, it invokes the *queue*d commands
remotely on the server using the command `ssh john@flipstack.com`.

    $ mina logs --simulate
    # Execute the following commands via
    # ssh john@flipstack.com:
    #
    echo "Contents of the log file are as follows:"
    tail -f /var/log/apache.log
