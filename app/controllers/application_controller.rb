class ApplicationController < ActionController::API
  def petfinder_service
    @service ||= PetFinderService.new
  end
end
