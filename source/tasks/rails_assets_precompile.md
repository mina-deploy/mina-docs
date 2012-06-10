---
title: rails:assets_precompile
group: Rails tasks
brief: Precompiles Rails assets.
---

Precompiles assets. This invokes `rake assets:precompile`. This is relevant to
Rails 3.1+ projects.

    # config/deploy.rb
    require 'mina/git'
    require 'mina/bundler'

    # ... settings here

    task :deploy do
      deploy do
        invoke :'git:clone'
        invoke :'bundle:install'
        invoke :'rails:db_migrate'
        invoke :'rails:assets_precompile'
      end
    end

It also checks the current version to see if it has assets compiled. If it does,
it reuses them, skipping the compilation step. To stop this behavior, invoke
the `mina` command with `force_assets=1`.

To use this, you must add `require 'mina/rails'` to your *deploy.rb*.
