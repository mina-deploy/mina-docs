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
end
