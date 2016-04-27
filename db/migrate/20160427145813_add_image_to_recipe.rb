class AddImageToRecipe < ActiveRecord::Migration
  def change
    add_column :recipes, :image_id, :string
    add_column :recipes, :image_filename, :string
    add_column :recipes, :image_size, :string
    add_column :recipes, :image_content_type, :string
  end
end
