# --- ここから追加 ---
module Api
  module V1
	class RestaurantsController < ApplicationController
	  def index
		restaurants = Restaurant.all

		render json: {
		  restaurants: restaurants
		}, status: :ok
	  end
	  
	  def show
		  restaurant = Restaurant.find(params[:id])
		  foods = restaurant.foods
		  
		  render json: {
			  restaurants: restaurant,
			  foods: foods
		  }, status: :ok
	  end
	end
  end
end
