class RemoveDescriptionFromRecipe < ActiveRecord::Migration
  def change
    remove_column :recipes, :description, :text
  end
end
