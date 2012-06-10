activate :automatic_image_sizes
activate :relative_assets
activate :mmdoc

set :layout, :'_templates/layout'
set :github, 'nadarei/mina'
set :relative_links, true

configure :build do
  compass_config do |config|
    config.output_style = :compact
    config.line_comments = false
  end

  activate :cache_buster
end

# https://github.com/middleman/middleman-blog/blob/master/lib/middleman-blog/commands/article.rb
#
# Dir.chdir code_path do
#   tomdoc.parse 'lib/mina/helpers.rb'
# end
#
# tomdoc.import 'Mina::DeployHelpers', into: 'source/api/helpers/', type: 'md'
# tomdoc.import 'Mina::Helpers', into: 'source/api/helpers/', type: 'md'
#
# How to use TomDoc:
# Make a new generator, then
# gen = TomDocGenerator.new
# files.each { |f| gen.generate(file) }
#
# class Generator
#   def initialize
#     @methods = Array.new
#   end
#
#   def write_method(method, prefix)
#     # name = "#{prefix}#{method}#{args}"
#     @methods << { :prefix => prefix,
#       :name => method_name,
#       :args => args,
#       :comment => method.tomdoc.tomdoc }
#   end
# end
#
# # TomDoc::SourceParser.parse(contents)
