---
title: deploy:link_shared_paths
group: Deploy tasks
brief: Creates symlinks for the shared files.
---

Creates symbolic links to paths in [shared_paths](../settings/shared_paths.html) setting. This setting is not
to be confused with [shared_path](../settings/shared_path.html) that specifies the directory path where files are
shared between releases.

Invoke this as a subtask in your [config/deploy.rb](../about_deploy_rb.html).

    require 'mina/git'

    # ... settings here
    set :shared_paths, ['config/database.yml', 'config/s3.yml']

    task :deploy do
      deploy do
        invoke 'git:clone'
        invoke 'deploy:link_shared_paths'
        # In this case, symlinks config/database.yml and
        # config/s3.yml are created in the release path
        # that points to their corresponding files in the
        # shared_path directory.
        # ...
      end
      # ...
    end
