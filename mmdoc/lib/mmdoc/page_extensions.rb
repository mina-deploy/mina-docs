module Mmdoc
  module PageExtensions
    # Returns the metadata for the current page.
    def data
      metadata[:page]
    end

    # Returns true if the resource is meant to be an HTML page.
    def html?
      return true if ext == '.html'

      engine = Tilt[ext]
      engine && (engine.default_mime_type.nil? || engine.default_mime_type == 'text/html')
    end

    # Returns the depth of the page. Top-level pages have a depth of 0.
    def depth
      parent ? parent.depth + 1 : 0
    end

    def root?
      depth == 0
    end

    def to_s
      title
    end

    def parent?
      !! parent
    end

    def title
      data['title'] || basename
    end

    def basename
      File.basename destination_path
    end

    def sort_index
      [ (data['order'] || 99999), @basename ]
    end

    def <=>(other)
      sort_index <=> other.sort_index
    end

    # Returns an array of resources representing the ancestors of the current page.
    #
    # The crumbs start with the root page, with the last crumb being the page itself.
    def breadcrumbs
      if parent
        [ *parent.breadcrumbs, self ]
      else
        [ self ]
      end
    end

    # Returns the raw content without frontmatter.
    def content
      _, content = app.frontmatter_manager.data(source_file)
      content
    end

    # Returns all siblings including itself.
    def all_siblings
      parent ? parent.children : []
    end
  end
end
