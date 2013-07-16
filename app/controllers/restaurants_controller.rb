class RestaurantsController < ApplicationController
  before_action :set_restaurant, only: [:show, :edit, :update, :destroy]

  def index
    @restaurants = Restaurant.all

    if params[:city] && params[:name]
      @restaurants = Restaurant.where("city LIKE ?", "%#{params[:city]}%")
      @restaurants = Restaurant.where("name LIKE ?", "%#{params[:name]}%")
    elsif params[:city]
      @restaurants = Restaurant.where("city LIKE ?", "%#{params[:city]}%")
    elsif params[:name]
      @restaurants = Restaurant.where("name LIKE ?", "%#{params[:name]}%")
    end
  end

  def show
    @dishes = @restaurant.dishes.to_a
  end

  def new
    @restaurant = Restaurant.new

    respond_to do |format|
      format.html { render action: 'new' }
      format.js { render 'new.js.erb' }
    end
  end

  def edit
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)

    respond_to do |format|
      if @restaurant.save
        format.html { redirect_to @restaurant, notice: 'Restaurant was successfully created.' }
        format.js { render 'create.js.erb' }
      else
        format.html { render action: 'new' }
        format.json { render json: @restaurant.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @restaurant.update(restaurant_params)
        format.html { redirect_to @restaurant, notice: 'Restaurant was successfully updated.' }
        format.js { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @restaurant.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @restaurant.destroy
    respond_to do |format|
      format.html { redirect_to restaurants_url }
      format.json { head :no_content }
    end
  end

  private
    def set_restaurant
      @restaurant = Restaurant.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def restaurant_params
      params.require(:restaurant).permit(:name, :address, :city)
    end
end
