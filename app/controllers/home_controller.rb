class HomeController < ApplicationController
  def index
    @recipes = Recipe.order(:title)
  end
end
