class RestaurantsController < ApplicationController
  def index
    @restaurants = Restaurant.all
  end

  def show
    id = params[:id]
    @restaurant = Restaurant.find(id)
    @reviews = @restaurant.reviews
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    redirect_to restaurants_path if @restaurant.save
    render :new, status: :unprocessable_entity
  end

  private

  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :phone_number, :category)
  end
end
