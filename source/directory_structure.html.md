---
title: Directory structure
order: 5
group: Getting started
---

The deploy procedures make the assumption that you have a folder like so:

    /var/www/flipstack.com/     # The deploy_to path
     |-  releases/              # Holds releases, one subdir per release
     |   |- 1/
     |   |- 2/
     |   |- 3/
     |   '- ...
     |-  shared/                # Holds files shared between releases
     |   |- logs/               # Log files are usually stored here
     |   `- ...
     '-  current/               # A symlink to the current release in releases/

It also assumes that the `deploy_to` path is fully writeable/readable for the
user we're going to SSH with.

