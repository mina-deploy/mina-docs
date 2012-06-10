---
title: term_mode
group: General settings
---

If set to `:pretty`, prettifies the output with indentations. Otherwise, simply
invokes the commands.

    # config/deploy.rb
    set :term_mode, :pretty
    set :term_mode, nil

Invoking `deploy` or `deploy_script` defaults this to `:pretty`.
(Default with deploys.)
