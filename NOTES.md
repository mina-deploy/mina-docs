Would be cool if you can import tomdoc like this

``` ruby
# config.rb

on_sync_docs do
  Dir.chdir code_path do
    tomdoc.parse 'lib/mina/helpers.rb'
  end

  tomdoc.import 'Mina::DeployHelpers', into: 'source/api/helpers/', type: 'md'
  tomdoc.import 'Mina::Helpers', into: 'source/api/helpers/', type: 'md'
end
```

Then:

```
$ middleman sync_docs
```

How to use TomDoc:
 * Make a new generator, then
 * gen = TomDocGenerator.new
 * files.each { |f| gen.generate(file) }

Generator can be like:

``` ruby
class Generator
  def initialize
    @methods = Array.new
  end

  def write_method(method, prefix)
    # name = "#{prefix}#{method}#{args}"
    @methods << { :prefix => prefix,
      :name => method_name,
      :args => args,
      :comment => method.tomdoc.tomdoc }
  end
end

# TomDoc::SourceParser.parse(contents)
```

You can add commands like so 
https://github.com/middleman/middleman-blog/blob/master/lib/middleman-blog/commands/article.rb
