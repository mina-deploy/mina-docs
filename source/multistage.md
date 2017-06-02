---
title: Multiple stages
order: 6
group: Getting started
---

Configuring multiple stages is easy, since we can just use Rake.
Replace your `set :domain` line with a case statement allows you
to specify a stage on the command line.

    # config/deploy.rb
    case ENV['to']
    when 'staging'
      set :domain, "staging.example.com"
    else
      set :domain, "www.example.com"
    end

<br clear='both' />

Your default deploy target is the domain specified in the `else`
part of the case statement. Other targets are specified on the
command line using the `to` environment variable.

    $ mina deploy to=staging
    # This will deploy to staging.example.com
