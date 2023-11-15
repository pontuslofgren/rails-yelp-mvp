class RestaurantsController < ApplicationController
  before_action :set_restaurants, only: [ :index ]
  before_action :set_restaurant, only: [ :show ]
  before_action :set_restaurant_rating, only: [ :show ]

  def index
  end

  def show
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

  def set_restaurant_rating
    arr = []
    @restaurant.reviews.each { |review| arr.push(review.rating.to_i)}
    @restaurant_rating = arr.inject(0.0) { |sum, el| sum + el } / arr.size
  end

end


# @restaurant.reviews.each do |review|
#   @average_rating += review.rating.to_i
# end
