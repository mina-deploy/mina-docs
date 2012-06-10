---
title: verbose_mode
group: Helpers
---

Checks if Rake was invoked with `--verbose`.

    # .rb
    task :solr_restart do
      puts "Restarting solr..."  if verbose_mode
      queue echo_cmd "sudo service solr restart"
    end

See [command line options](../command_line_options.html) for more info.
