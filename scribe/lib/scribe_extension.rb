require 'middleman-core'

module ScribeExtension
  class << self
    # Root path
    def root(*args)
      File.join File.dirname(__FILE__), *args
    end

    def registered(app, options={})
      require root('page')
      require root('pages')
      require root('page_helpers')
      require root('misc_helpers')
      require root('index_builder')

      app.helpers PageHelpers
      app.helpers MiscHelpers
    end
  end
end

::Middleman::Extensions.register(:scribe) { ::ScribeExtension }
