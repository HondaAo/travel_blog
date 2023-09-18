module Api
  class CountriesController < ApplicationController
    def index
      countries = City.all.includes(:posts)
      render json: { countries }, status: :ok
    end

    def show
      country = Country.find(params[:id]).includes(:posts)
      render json: { country }, status: :ok
    end
  end
end