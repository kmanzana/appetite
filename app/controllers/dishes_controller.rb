class DishesController < ApplicationController
  def index
  end

  def show
  	@dish = Dish.find params[:id]
  end

  def new
  	@restaurant = Restaurant.find params[:restaurant_id]
  	@dish = Dish.new

    respond_to do |format|
      format.html { render 'new' }
      format.js { render 'new.js.erb' }
    end
  end

  def create
  	@dish = Dish.new dish_params

  	if @dish.save
  		redirect_to restaurant_url(@dish.restaurant_id)
  	else
  		render 'new'
  	end
  end

  def destroy
  end

  def edit
  	@dish = Dish.find params[:id]
  	@restaurant = @dish.restaurant

    respond_to do |format|
      format.html { render 'edit' }
      format.js { render 'edit.js.erb' }
    end
  end

  def update
  	@dish = Dish.find params[:id]
  	if @dish.update(dish_params)
  		redirect_to restaurant_url(@dish.restaurant_id)
  	else
  		render 'edit'
  	end
  end

  private

  def dish_params
    params.require(:dish).permit(:restaurant_id, :name, :price, :image_url)
  end
end
