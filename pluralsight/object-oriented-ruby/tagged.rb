module Tagged
  def tag(tag)
    @tags ||= []
    @tags << tag
  end

  def untag(tag)
    @tage.delete(tag) if !@tags.nil?
  end

  attr_reader :tags
end
