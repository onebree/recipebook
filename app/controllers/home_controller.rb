class HomeController < ApplicationController
  def index
    @categories = Category.order(:name)
  end

  def search
    if params[:search].blank?
      redirect_to root_path
    elsif params[:search] == "unsorted recipes"
      @recipes = Recipe.unsorted.sort_by(&:title)
    else
      @recipes = Recipe.where(archived: false).search(params[:search]).order(:title)
    end
  end
end
