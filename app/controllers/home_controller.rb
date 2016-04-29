class HomeController < ApplicationController
  def index
    @categories = Category.order(:name)
  end

  def search
    if params[:search].blank?
      redirect_to root_path
    else
      @recipes = Recipe.where(archived: false).search(params[:search]).order(:title)
    end
  end
end
