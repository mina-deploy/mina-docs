module PageHelpers
  # Returns the current page.
  def here
    Page.glob(request.path + '.*').first
  end

  def all_pages
    Page.all
  end

  def roots
    Page.roots
  end

  # Returns the main page.
  def index
    Page.glob('index.html.*').first
  end

  # Returns the name of the site.
  def site_name
    index ? index.title : "Site"
  end

  # Returns groups for the side nav.
  # Returns a hash with keys as group names, values as Page arrays (Pages).
  def nav_groups
    children = here.children.any? ? here.children : here.siblings
    groups = children.groups
    groups[here.title] = groups.delete("")  if groups[""]
    groups
  end

  # Breadcrumbs for side nav.
  def nav_breadcrumbs
    parent = (here.children.any? ? here : here.parent) || here
    parent.breadcrumbs
  end

  # Returns a CSS class name for a Page.
  def item_class(page)
    [
      ('active'  if page.path == here.path),
      ('more'    if page.children.any?)
    ].compact.join(' ')
  end
end
