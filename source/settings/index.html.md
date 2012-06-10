---
title: Settings
group: API
order: 32
---

Settings are managed using the `set` and `settings` methods. This convention is
inspired by Sinatra and Vlad.

    # config/deploy.rb
    set :version, "v2.0.5"

    settings.version    #=> "v2.0.5"
    settings.version?   #=> true

<br clear='both'>

You can also retrieve settings without the `settings.` prefix.

    # config/deploy.rb
    set :version, "v2.0.5"

    version    #=> "v2.0.5"
    version?   #=> true

### Dynamic values

You can also give settings using a lambda. When the setting is retrieved, it
will be evaluated.

    # config/deploy.rb
    set :tag, lambda { "release/#{version}" }
    set :version, "v2.0.5"

    tag    #=> "release/v2.0.5"

### Inside and outside tasks

All of these are accessible inside and outside tasks.

    # config/deploy.rb
    set :admin_email, "johnsmith@gmail.com"

    task :email do
      set :message, "Deploy is done"

      system "echo #{message} | mail #{admin_email}"
    end

### Validations

If you would like an error to be thrown if a setting is not present, add a bang
at the end.

    # config/deploy.rb
    task :restart do
      queue "#{settings.nginx_path!}/sbin/nginx restart"
    end

    # $ mina restart
    # Error: You must set the :nginx_path setting
