require 'middleman-core'

module Mmdoc
  module Extension
    class << self
      # Root path
      def root(*args)
        File.join File.dirname(__FILE__), *args
      end

      def registered(app, options={})
        app.helpers PageHelpers
        app.helpers MiscHelpers
      end
    end
  end
end

::Middleman::Extensions.register(:mmdoc) { ::Mmdoc::Extension }
