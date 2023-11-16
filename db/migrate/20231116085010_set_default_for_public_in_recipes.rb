class SetDefaultForPublicInRecipes < ActiveRecord::Migration[7.1]
  def change
    change_column_default :recipes, :public, from: nil, to: false
  end
end
