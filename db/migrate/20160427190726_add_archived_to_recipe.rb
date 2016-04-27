class AddArchivedToRecipe < ActiveRecord::Migration
  def change
    add_column :recipes, :archived, :boolean, default: false
    add_column :categories, :archived, :boolean, default: false
  end
end
