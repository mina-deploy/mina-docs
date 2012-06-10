module Mmdoc
  module PageExtensions
    def data
      metadata[:page]
    end

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

    def breadcrumbs
      if parent?
        [ *parent.breadcrumbs, self ]
      else
        [ self ]
      end
    end

    # Returns the raw content without frontmatter.
    def content
      ""
    end

    # Returns all siblings including itself.
    def all_siblings
      parent ? parent.children : []
    end
  end
end
