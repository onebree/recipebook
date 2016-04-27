class AddAttributesToRecipe < ActiveRecord::Migration
  def change
    change_table :recipes do |t|
      t.rename :instructions, :directions
      t.rename :compiled_instructions, :compiled_directions

      t.text :ingredients
      t.text :compiled_ingredients
      t.text :notes
      t.text :compiled_notes

      t.text    :source
      t.integer :calories
      t.string  :time
      t.string  :yield
    end
  end
end
