---
title: git:clone
group: Git tasks
---

Clones the git repository defined in [:repository](../settings/repository.html).
Usually used in deploy scripts.

    # config/deploy.rb
    require 'mina/git'

    set :repository, 'https://github.com/you/your-app.git'

    task :deploy do
      deploy do
        invoke :'git:clone'
      end
    end

To use this, you must add `require 'mina/git'` to your *deploy.rb*.

### Specifying revisions

By default, it checks your local Git directory for the SHA1 and deploys that.
If you would like to specify your own, use the
[:revision](/settings/revision.html) setting.

    # config/deploy.rb
    require 'mina/git'

    set :repository, 'https://github.com/you/your-app.git'

    # Allow calling as `mina deploy at=master`
    set :revision, ENV['at']  if ENV['at']

    task :deploy do
      deploy do
        invoke :'git:clone'
      end
    end
