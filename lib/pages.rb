class Pages < Array
  def groups(attribute='group')
    group_by { |p| p.data[attribute.to_s] }
  end

  def indices
    require 'lib/index_builder'
    i = IndexBuilder.new(self)
    i.indices
  end
end
