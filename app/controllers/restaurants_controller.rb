class RestaurantsController < ApplicationController
  before_action :set_restaurants, only: [ :index ]
  before_action :set_restaurant, only: [ :show ]


  def index
  end

  def show
    @review = Review.new
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    if @restaurant.save
      puts "Saved"
      redirect_to restaurant_path(@restaurant)
    else
      render :new, status: :unprocessable_entity
      puts "Not saved"
      p @restaurant
    end
  end

  private

  def set_restaurants
    @restaurants = Restaurant.all
  end

  def set_restaurant
    @restaurant = Restaurant.find(params[:id])
  end

  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :phone_number, :category)
  end
end
