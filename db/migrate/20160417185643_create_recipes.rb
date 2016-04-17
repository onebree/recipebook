class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.text :title
      t.text :instruction

      t.timestamps null: false
    end
  end
end
