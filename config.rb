activate :automatic_image_sizes
activate :relative_assets
activate :mmdoc

set :layout, :'_templates/layout'
set :github, 'nadarei/mina'
set :relative_links, true

helpers Mmdoc::AnalyticsHelpers

configure :build do
  compass_config do |config|
    config.output_style = :compact
    config.line_comments = false
  end

  activate :cache_buster
end
