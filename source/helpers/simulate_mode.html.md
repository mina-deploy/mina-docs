---
title: simulate_mode
group: Helpers
---

Checks if Rake was invoked with `--simulate`.

    # .rb
    task :git_check do
      revision = if simulate_mode
        'master'
      else
        `git rev-parse HEAD`.strip
      end

      queue echo_cmd "git log #{revision}"
    end

See [command line options](../command_line_options.html) for more info.
