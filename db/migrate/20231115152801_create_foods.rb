class CreateFoods < ActiveRecord::Migration[7.1]
  def change
    create_table :foods do |t|
      t.string :name
      t.dicimal :measurement_unit
      t.dicimal :price
      t.integer :quantity
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
