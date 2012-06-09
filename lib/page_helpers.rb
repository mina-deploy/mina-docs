module PageHelpers
  def here
    Page.glob(request.path + '.*').first
  end

  def all_pages
    Page.all
  end

  def roots
    Page.roots
  end

  def index
    Page.glob('index').first
  end

  def site_name
    index ? index.title : "Site"
  end
end
