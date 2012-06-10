---
title: About deploy.rb
order: 2
group: Getting started
---

The file `deploy.rb` is simply a Rakefile invoked by Rake. In fact, `mina` is
mostly an alias that invokes Rake to load `deploy.rb`.

    # Sample config/deploy.rb
    set :domain, 'your.server.com'

    task :restart do
      queue 'sudo service restart apache'
    end

As it's all Rake, you can define tasks that you can invoke using `mina`. In this
example, it provides the `mina restart` command.

The magic of Mina is in the new commands it gives you.

The `queue` command queues up Bash commands to be ran on the remote server.
If you invoke `mina restart`, it will invoke the task above and run the queued
commands on the remote server `your.server.com` via SSH.

See [the command queue](#the_command_queue) for more information on the *queue*
command.
