Mmdoc
=====

Middleman documentation helpers.

Yay, Mmdoc! Add me to your Middleman project.

``` ruby
# Gemfile
git "git://github.com/nadarei/mina-docs.git" do
  gem "mmdoc"
end
```

Then copy the following files to your Middleman project:

 * `source/_templates/layout.haml`
 * `source/stylesheet/site.css.scss`
 * `source/javascripts/site.js`
 * `Rakefile`

Now start making `.html.md` files (or whatever markup language you want) and add
YAML frontmatters. Only `title` is required:

``` yaml
---
title: Your page title
order: 2
group: API calls
brief: This is awesome.
---
```

Go and use the PageHelpers in your layout.
