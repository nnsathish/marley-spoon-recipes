class RecipeWrapper < Contentful::Entry
  def image_url(opts = {})
    self.photo.url(opts)
  end

  def chef_name
    self.chef.name
  rescue Contentful::EmptyFieldError
    nil
  end

  def tag_names
    self.tags.map(&:name)
  rescue Contentful::EmptyFieldError
    []
  end
end
