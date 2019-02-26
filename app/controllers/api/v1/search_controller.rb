class Api::V1::SearchController < ApplicationController

  def new
    results = petfinder_service.search(search_params)
    search_results = Search.new(results)
    search_results.create_pet_objects

    render json: PetSerializer.new(search_results.results)
  end

  private

  def search_params
    params.permit(:location, :sex, :animal_type)
  end
end
