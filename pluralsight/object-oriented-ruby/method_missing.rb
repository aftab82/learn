class Query
  # Replace the query's dataset with dataset returned by the method call
  def method_missing(method, *args, &block)
    @dataset = @dataset.__send__(method, *args, &block)
    if !@dataset.is_a?(Dataset)
      raise(SQL::Error, "#{method.inspect} did not return a Dataset")
    end
    self
  end
end
