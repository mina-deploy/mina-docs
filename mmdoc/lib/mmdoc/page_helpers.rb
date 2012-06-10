module Mmdoc
  # Public: Helpers for pages.
  # These helpers are available for use on templates.
  module PageHelpers
    # Public: Returns the current page.
    #
    # Returns a Page instance.
    def here
      sitemap.find_resource_by_destination_path(request.path)
    end

    # Public: Returns an array of all pages in the site.
    def all_pages
      sitemap.resources
    end

    # Returns index data for the entire site.
    def site_indices
      i = IndexBuilder.new(all_pages)
      i.indices
    end

    # Public: Returns the top-level pages. Best used for top-level navigation.
    def roots
      all_pages.select { |page| page.root? }
    end

    # Public: Returns the main index page.
    def index
      sitemap.find_resource_by_destination_path '/index.html'
    end

    # Public: Returns the name of the site.
    def site_name
      index ? index.title : "Site"
    end

    # Public: Returns groups for the side nav.
    # Returns a hash with keys as group names, values as Page arrays (Pages).
    #
    # Example
    #
    #   nav_groups
    #   #=> { 'Git tasks' => [ <Page>, <Page>, ... ],
    #   #     'Bundler tasks' => [ <Page>, <Page>, ... ],
    #   #    ... }
    #
    def nav_groups
      children = here.children.any? ? here.children : here.all_siblings
      groups = children.group_by { |p| p.data['group'] }
      groups[here.title] = groups.delete("")  if groups[""]
      groups
    end

    # Public: Breadcrumbs for side nav.
    # Returns an array of Pages, starting from the top-level page.
    def nav_breadcrumbs
      parent = (here.children.any? ? here : here.parent) || here
      parent.breadcrumbs
    end

    # Public: Returns a CSS class name for a Page.
    #
    # page - The page instance.
    #
    # Returns a string to be used in an HTML tag's `class` attribute.
    def item_class(page)
      [
        ('active'  if page.path == here.path),
        ('more'    if page.children.any?)
      ].compact.join(' ')
    end
  end
end
