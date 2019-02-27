require "date"
class Api::V1::PetsController < ApplicationController

  def show
    if pet_params[:id] == "random"
      # Rails.cache.fetch("#{Date.today}/daily_pet", expires_in: 1.hours) do
        pet_id = petfinder_service.get_random_pet[:petfinder][:petIds][:id][:$t]
        pet_result = petfinder_service.get_pet_by_id(pet_id)[:petfinder][:pet]

        daily_pet = Pet.new(pet_result)

        render json: PetSerializer.new(daily_pet)
      # end
    end
  end

  private

  def pet_params
    params.permit(:id)
  end

end
