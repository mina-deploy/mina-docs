---
title: Mina documentation
order: 1
brief: Really fast deployer and server automation tool.
---

Mina works really fast because it's a deploy Bash script generator. It
generates an entire procedure as a Bash script and runs it remotely in the
server.

Compare this to the likes of Vlad or Capistrano, where each command
is ran separately on their own SSH sessions. Mina only creates *one* SSH
session per deploy, minimizing the SSH connection overhead.

    $ gem install mina
    $ mina

Features
--------

* __Really fast.__ Mina only makes one SSH connection per deploy. It
  builds a Bash script and executes it remotely, reducing the overhead of
  creating SSH connections to do processing locally (like Vlad or Capistrano
  does).

* __Safe deploys.__ New releases are built on a temp folder. If the deploy
  script fails at any point, the build is deleted and it'd be as if nothing
  happened.

* __Locks.__ Deploy scripts rely on a lockfile ensuring only one deploy can
  happen at a time.

* __Works with anything.__ While Mina is built with Rails projects it
  mind, it can be used on just about any type of project deployable via SSH,
  Ruby or not.

* __Built with Rake.__ Setting up tasks will be very familiar! No YAML files
  here. Everything is written in Ruby, giving you the power to be as flexible in
  your configuration as needed.

