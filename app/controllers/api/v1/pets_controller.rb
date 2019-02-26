class Api::V1::PetsController < ApplicationController

  def show
    if pet_params[:id] == "random"
      pet_id = petfinder_service.get_random_pet[:petfinder][:petIds][:id][:$t]
      pet_result = petfinder_service.get_pet_by_id(pet_id)
      daily_pet = Pet.new(pet_result)

      render json: PetSerializer.new(daily_pet)
    end
  end

  private

  def pet_params
    params.permit(:id)
  end

end
