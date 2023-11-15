class CreateRecipes < ActiveRecord::Migration[7.1]
  def change
    create_table :recipes do |t|
      t.string :name
      t.integer :prepraration_time
      t.integer :cooking_time
      t.string :description
      t.boolean :public
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
