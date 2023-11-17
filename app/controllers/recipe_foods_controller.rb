class RecipeFoodsController < ApplicationController
  def index; end

  def new
    @recipe = Recipe.find(params[:recipe_id])
    @foods = Food.all
    @new_ingredient = RecipeFood.new
  end

  def create
    @new_ingredient = RecipeFood.new(recipe_food_params)
    if @new_ingredient.save
      redirect_to recipe_path(@new_ingredient.recipe_id), notice: 'Ingredient was successfully created.'
    else

    end
  end

  private

  def recipe_food_params
    params.require(:recipe_food).permit(:food_id, :quantity, :recipe_id)
  end
end
