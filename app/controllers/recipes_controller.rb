class RecipesController < ApplicationController
  def index
    service = FetchRecipesService.call
    set_error_flash(service)
    @recipes = service.data
  end

  def show
    service = FetchRecipesService.call(id: params[:id])
    set_error_flash(service)
    @recipe = service.data
  end

  private

  def set_error_flash(service)
    if service.failure?
      flash.now[:error] = 'Unable to load data. Please try again later.'
    end
  end
end
