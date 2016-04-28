class RemoveCompiledFromRecipe < ActiveRecord::Migration
  def change
    remove_column :recipes, :compiled_ingredients, :text
    remove_column :recipes, :compiled_directions, :text
    remove_column :recipes, :compiled_notes, :text
  end
end
