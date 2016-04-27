class HomeController < ApplicationController
  def index
    if params[:search].blank?
      @recipes = Recipe.where(archived: false).order(:title)
    else
      @recipes = Recipe.where(archived: false).search(params[:search]).order(:title)
    end
  end
end
