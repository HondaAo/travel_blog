module Api
  class CitiesController < ApplicationController
    def index
      cities = City.first(10).includes(:posts)
      render json: { data: cities }, status: :ok
    end

    def show
      city = City.find(params[:id]).includes(:posts)
    end

    def update

    end
  end
end