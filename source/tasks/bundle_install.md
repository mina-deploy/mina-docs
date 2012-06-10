---
title: bundle:install
group: Bundler tasks
---

Invokes `bundle:install` on the current directory, creating the bundle
path (specified in `bundle_path`), and invoking `bundle install`.
Usually used in deploy scripts.

    # config/deploy.rb
    require 'mina/git'
    require 'mina/bundler'   # <- don't forget
    
    # ... settings here
    
    task :deploy do
      deploy do
        invoke :'git:clone'
        invoke :'bundle:install'
      end
    end

<br clear='all' />

This example looks like this:

    $ mina deploy --verbose
    ...
    ------> Installing gem dependencies using Bundler
            $ bundle install --without test:development --deployment

<br clear='all' />

The `bundle_path` is only created if `bundle_path` is set (which is on
by default).

This is only relevant if you require the bundler addon with `require
'mina/bundler'`.
