activate :automatic_image_sizes
activate :relative_assets

require 'lib/page'
require 'lib/pages'
require 'lib/page_helpers'
require 'lib/misc_helpers'

helpers PageHelpers
helpers MiscHelpers

set :layout, :'_templates/layout'

configure :build do
  compass_config do |config|
    config.output_style = :compact
    config.line_comments = false
  end

  activate :cache_buster
end
