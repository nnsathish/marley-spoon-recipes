class FetchRecipesService < BaseService
  attr_reader :options

  def initialize(options = {})
    super
    @options = options
  end

  def call
    recipes = fetch_recipes
    set_data!(recipes)
  rescue StandardError => ex
    log_exception(ex)
    set_error!(:fetch_error)
    set_data!([])
  end

  private

  def fetch_recipes
    recipe_id = options[:id].presence
    recipes = if recipe_id
      wrapper.recipe(recipe_id)
    else
      wrapper.recipes
    end
  end

  def wrapper
    @wrapper ||= ContentfulClientWrapper.new(options)
  end
end
