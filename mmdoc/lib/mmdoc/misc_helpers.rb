module Mmdoc
  module MiscHelpers
    # Relativize a path
    def rel(url)
      # Assume abs path
      url = url[1..-1]
      url = url.squeeze('/')

      # Append ../'s
      depth = request.path.count('/') - 1
      path = '../' * depth + url

      path.squeeze('/')
    end
  end
end
