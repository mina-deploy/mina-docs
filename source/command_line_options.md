---
title: Command line options
group: API
order: 30
---

Basic usage:

    $ mina [OPTIONS] [TASKS] [VAR1=val VAR2=val ...]

### Options

* `-v` / `--verbose` - This will show commands being done on the server. Off by
  default.

* `-S` / `--simulate` - This will not invoke any SSH connections; instead, it
  will simply output the script it builds.

* `-t` / `--trace` - Show backtraces when errors occur.

* `-f FILE` - Use a custom deploy.rb configuration.

* `-V` / `--version` - Shows the current version.

### Tasks

There are many tasks available. See the [tasks reference](tasks/index.html), or 
type `mina tasks`.

### Variables

You may specify additional variables in the `KEY=value` style, just like Rake.
You can add as many variables as needed.

    $ mina restart on=staging

    # This sets the ENV['on'] variable to 'staging'.
