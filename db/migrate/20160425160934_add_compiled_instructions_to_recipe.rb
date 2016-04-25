class AddCompiledInstructionsToRecipe < ActiveRecord::Migration
  def change
    add_column :recipes, :compiled_instructions, :text
  end
end
