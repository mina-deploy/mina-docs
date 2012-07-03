---
title: shared_paths
group: Deploy settings
brief: Symbolic link files that will be created to point to shared_path.
---

An array of files that the task [deploy:link_shared_paths](../tasks/deploy_link_shared_paths.html)
will enumerate to create symbolic links, each pointing to their corresponding
file in the directory specified by the `shared_path` setting.

    set :shared_paths, ['config/database.yml', 'config/s3.yml']

See [deploy:link_shared_paths](../tasks/deploy_link_shared_paths.html) for full example.
