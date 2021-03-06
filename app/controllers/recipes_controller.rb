class RecipesController < ApplicationController
  def show
    @recipe = Recipe.find(params[:id])
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(recipe_params)
    if @recipe.save
      redirect_to recipe_path(@recipe)
    else
      render :new
    end
  end

  def edit
    @recipe = Recipe.find(params[:id])
  end

  def update
    @recipe = Recipe.find(params[:id])
    if @recipe.update_attributes(recipe_params)
      redirect_to recipe_path(@recipe)
    else
      render :edit
    end
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.update_attributes(archived: true)
    flash[:warning] = %Q(
      You have deleted the recipe "#{@recipe.title}". Please
      <a href="#{restore_recipe_path(@recipe.id)}">click here</a> to restore it.
    )
    redirect_to root_path
  end

  def restore
    @recipe = Recipe.find(params[:id])
    @recipe.update_attributes(archived: false)
    flash[:success] = "You have successfully restored \"#{@recipe.title}\"."
    redirect_to root_path
  end

  private

  def recipe_params
    new_params = params.require(:recipe).permit!
    new_params.merge(recipe_categories)
  end

  def recipe_categories
    categories = 
      if params[:categories]
        params[:categories].map { |c| Category.find_or_create_by(name: c).id }
      else
        []
    end
    { category_ids: categories }
  end
end
