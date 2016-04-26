class HomeController < ApplicationController
  def index
    if params[:search].blank?
      @recipes = Recipe.order(:title)
    else
      @recipes = Recipe.search(params[:search]).order(:title)
    end
  end
end
