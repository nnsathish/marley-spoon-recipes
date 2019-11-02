class FetchRecipesService < BaseService
  attr_reader :options

  def initialize(options = {})
    super
    @options = options
  end

  def call
    recipes = wrapper.recipes
    set_data!(recipes)
  rescue StandardError => ex
    log_exception(ex)
    set_error!(:fetch_error)
    set_data!([])
  end

  private

  def wrapper
    @wrapper ||= ContentfulClientWrapper.new(options)
  end
end
