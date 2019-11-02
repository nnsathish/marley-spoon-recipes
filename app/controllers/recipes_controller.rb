class RecipesController < ApplicationController
  def index
    service = FetchRecipesService.call
    if service.failure?
      flash.now[:error] = 'Unable to load data. Please try again later.'
    end
    @recipes = service.data
  end
end
