class HomeController < ApplicationController
  def index
    if params[:search]
      @recipes = Recipe.search(params[:search]).order(:title)
    else
      @recipes = Recipe.order(:title)
    end
  end
end
