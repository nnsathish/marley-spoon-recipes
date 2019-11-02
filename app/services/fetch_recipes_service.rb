class FetchRecipesService < BaseService
  attr_reader :wrapper

  def initialize(options = {})
    super
    @wrapper = ContentfulClientWrapper.new(options)
  end

  def call
    recipes = wrapper.recipes
  rescue StandardError
    set_error!(:fetch_error)
    {}
  end
end
