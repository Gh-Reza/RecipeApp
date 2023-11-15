class CreateFoods < ActiveRecord::Migration[7.1]
  def change
    create_table :foods do |t|

      t.timestamps
    end
  end
end
