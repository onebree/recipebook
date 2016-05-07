class CategoriesController < ApplicationController
  before_action :logged_in_user, only: [:edit, :update, :destroy]

  def show
    @category = Category.find(params[:id])
    @recipes = @category.recipes.where(archived: false).order(:title)
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(category_params)
    if @category.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    @category = Category.find(params[:id])
  end

  def update
    @category = Category.find(params[:id])
    if @category.update_attributes(category_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy
    redirect_to root_path
  end
  
  private

  def category_params
    params.require(:category).permit!
  end

  def logged_in_user
    unless logged_in?
      flash[:danger] = "Please log in."
      redirect_to login_path
    end
  end
end
