class CreateFoods < ActiveRecord::Migration[7.1]
  def change
    create_table :foods do |t|
      t.string :name
      t.decimal :measurement_unit
      t.decimal :price
      t.integer :quantity
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
