class Recipe < ApplicationRecord
  has_many :recipe_foods, dependent: :destroy
  has_many :foods, through: :recipe_foods
  belongs_to :user

  validates :name, presence: true
  validates :prepraration_time, presence: true
  validates :cooking_time, presence: true

  def total_foods_price
    total_price = 0
    foods.each do |food|
      recipe_food = RecipeFood.find_by(recipe_id: id, food_id: food.id)
      food_total_price = food.price * recipe_food.quantity
      total_price += food_total_price
    end
    total_price
  end
end
