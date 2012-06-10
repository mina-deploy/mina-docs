---
title: echo_cmd
group: Helpers
---

Converts a bash command to a command that echoes before execution.
Used to show commands in verbose mode. This does nothing unless verbose mode is
on.

    # .rb
    queue echo_cmd("ln -nfs releases/2 current")

    # Queues the following command string:
    #
    #   echo "$ ln -nfs releases/2 current" &&
    #   ln -nfs releases/2 current

