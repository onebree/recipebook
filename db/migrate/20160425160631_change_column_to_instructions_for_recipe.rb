class ChangeColumnToInstructionsForRecipe < ActiveRecord::Migration
  def change
    rename_column :recipes, :instruction, :instructions
  end
end
