---
title: rails:db_migrate
group: Rails tasks
---

Invokes rake to migrate the database using `rake db:migrate`.

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

This is used as an `invoke`d subtask.

To use this, you must add `require 'mina/rails'` to your *deploy.rb*.

