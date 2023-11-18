class FoodsController < ApplicationController
  def index
    @food = Food.new
    @foods = current_user.foods
  end

  def create
    @food = current_user.foods.new(food_params)
    if @food.save
      redirect_to foods_path, notice: 'Great, you have a new food!'
    else
      flash.now[:alert] = 'Please fill in all required fields.'
      @foods = current_user.foods
      render :index
    end
  end

  def destroy
    @food = Food.find(params[:id])
    @food.destroy
    redirect_to foods_path, notice: 'Food item deleted.'
  end

  private

  def food_params
    params.require(:food).permit(:name, :measurement_unit, :price)
  end
end
