class RecipeWrapper < Contentful::Entry
  def image_url
    self.photo.url
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
