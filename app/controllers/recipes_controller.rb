class RecipesController < ApplicationController
  def index
    @recipes = Recipe.where(user_id: current_user.id)
  end

  def new
    @recipe = Recipe.new
  end

  def show
    @recipe = Recipe.find(params[:id])
    @foods = @recipe.foods
  end

  def create
    @recipe = Recipe.new(params.require(:recipe).permit(:name, :description, :prepraration_time, :cooking_time))
    @recipe.user_id = current_user.id
    if @recipe.save
      redirect_to recipes_path, notice: 'Recipe was successfully created.'
    else
      render :new
    end
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy
    redirect_to recipes_path, notice: 'Recipe was successfully deleted.'
  end

  def update_public
    @recipe = Recipe.find(params[:id])
    if @recipe.update(recipe_params)
      render json: { status: 'success' }
    else
      render json: { status: 'error', errors: @recipe.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def recipe_params
    params.require(:recipe).permit(:public)
  end

end
