require 'middleman-core'

module Mmdoc
  module Extension
    class << self
      # Root path
      def root(*args)
        File.join File.dirname(__FILE__), *args
      end

      def registered(app, options={})
        ::Middleman::Sitemap::Resource.send :include, PageExtensions
        app.helpers PageHelpers

        # Hack fix!
        # https://github.com/middleman/middleman/issues/474
        app.ready do
          unless sitemap.find_resource_by_path('/')
            require File.expand_path('../../../ext/relative_path_fix.rb', __FILE__)
          end
        end
      end
    end
  end
end

::Middleman::Extensions.register(:mmdoc) { ::Mmdoc::Extension }
