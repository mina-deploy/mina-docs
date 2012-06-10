---
title: Tasks
group: API
order: 32
---

You may define your own tasks just as you would in Rake, but these tasks come
default to all Mina deploy scripts.

    # config/deploy.rb
    desc "Shows logs."
    task :logs do
      queue %[cd #{deploy_to!} && tail -f logs/error.log]
    end

Some of them are meant to be invoking in the command line (like `mina setup`).

<br clear="both" />

Some of them are meant to be invoked in scripts (like
`invoke :'git:clone'`).

You can type `mina tasks` in the command line to see all tasks available.
