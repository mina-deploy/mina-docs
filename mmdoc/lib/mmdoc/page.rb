module Mmdoc
  # Public: Page model.
  #
  # Lookup usage
  #
  #   # Lookup by filename
  #   Page['index.html.haml']           #=> Page instance or nil
  #   Page.glob 'index.html.*'          #=> Array of Pages
  #
  #   Page.new 'index.html.haml'
  #
  # Metadata usage
  #
  #   page.title             #=> "Getting started"
  #   page.basename          #=> "getting_started"
  #   page.path              #=> "/getting_started/index.html"
  #   page.data              #=> Hash
  #   page.template_type     #=> "haml"
  #   page.raw               #=> String (raw template data)
  #   page.content           #=> String
  #
  # Tree traversal usage
  #
  #   page.parent?           #=> True/false
  #   page.parent            #=> Page, or nil if it's a root
  #   page.root?             #=> True if depth = 0
  #   page.depth             #=> Number, minimum of 0
  #   page.breadcrumbs       #=> Array of ancestors
  #   page.children          #=> Array
  #   page.siblings          #=> Array
  #
  # The arrays returned are of type Pages.
  #
  class Page
    attr_reader :path
    attr_reader :basename
    attr_reader :raw
    attr_reader :title
    attr_reader :data
    attr_reader :template_type

    def self.source_path
      'source'
    end

    # Internal: Globs for a given filespec.
    # Returns an array of pages.
    #
    # Example
    #
    #   glob('tasks/index.html.*')
    #   # Looks at 'source/tasks/index.html.*'
    #
    def self.glob(spec, except=nil)
      fullspec = File.join(source_path, spec)
      list = Dir[fullspec].map do |f|
        Page[ f[(source_path.length + 1)..-1] ]
      end.sort
      list = list.reject { |p| p.path == except.path }  if except
      list
    end

    def self.[](name)
      @pages ||= Hash.new
      @pages[name] ||= Page.new name
    end

    def self.roots
      Pages.new(glob('*.html.*') + glob('*/index.html.*'))
    end

    # Public: Returns all pages in the project.
    def self.all
      list = Array.new
      work = lambda { |page|
        list << page
        page.children.each { |subpage| work[subpage] }
      }
      roots.each { |page| work[page] }

      Pages.new list
    end

    def sort_index
      [ (data['order'] || 99999), @basename ]
    end

    def <=>(other)
      sort_index <=> other.sort_index
    end

    # Internal: Returns the main Middleman Application instance.
    def self.mm_server
      ::Middleman::Application.server.inst
    end

    # Internal: Returns the frontmatter manager of Middleman.
    def self.fm_manager
      mm_server.frontmatter_manager
    end

    def initialize(path)
      path = path.gsub(/^(\.?\/)+/, '')
      @basepath = (path =~ /^(.*)\.html\.([A-Za-z0-9]*)$/) && $1 || path
      @template_type = $2
      @basename = File.basename(@basepath)
      @dir = File.dirname(path)
      @parent_dir = File.dirname(@dir)
      @parent_dir = ''  if @parent_dir == '.'
      @full_path = File.join(self.class.source_path, path)
      @path = "/#{@basepath}.html"
      @data, @raw = self.class.fm_manager.data(path)
      @title = data['title'] || @basename
    end

    # Public: Returns the contents of the page.
    def content
      @content ||= @raw
    end

    def to_s
      title
    end

    def parent
      if @basename == 'index'
        # ./tasks/index.html is a child of ./index.html
        Page.glob(File.join(@parent_dir, 'index.html.*'), self).first
      else
        # ./tasks/git_clone.html is a child of ./tasks/index.html,
        # or ./tasks.html
        Page.glob(File.join(@dir, 'index.html.*'), self).first ||
        Page.glob(File.join(@parent_dir, "#{File.basename(@dir)}.html.*"), self).first
      end
    end

    def parent?
      !! parent
    end

    def root?
      ! parent?
    end

    def depth
      root ? 0 : parent.depth + 1
    end

    def breadcrumbs
      if parent?
        [ *parent.breadcrumbs, self ]
      else
        [ self ]
      end
    end

    def children
      list = if @basename == 'index' && !root?
        (Page.glob(File.join(@dir, '*.html.*'), self) +
        Page.glob(File.join(@dir, '*', 'index.html.*'), self)).sort
      else
        (Page.glob(File.join(@dir, @basepath, '*.html.*'), self) +
        Page.glob(File.join(@dir, @basepath, '*', 'index.html.*'), self)).sort
      end

      Pages.new list
    end

    def siblings
      if @basename == 'index' && !root?
        list = (Page.glob(File.join(@parent_dir, '*.html.*')) +
        Page.glob(File.join(@parent_dir, '*', 'index.html.*'))).sort
      else
        list = Page.glob(File.join(@dir, '*.html.*'))
        list = list.reject { |p| p.basename == 'index' }
        list += Page.glob(File.join(@dir, '*', 'index.html.*'))
        list = list.sort
      end
      Pages.new list
    end
  end
end
