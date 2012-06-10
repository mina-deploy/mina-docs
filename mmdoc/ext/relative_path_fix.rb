class Middleman::Sitemap::Store
  alias original_find_resource_by_path find_resource_by_path

  def find_resource_by_path(request_path)
    result =
      original_find_resource_by_path(request_path) ||
      original_find_resource_by_path((request_path + '/index.html').squeeze('/'))
  end
end
