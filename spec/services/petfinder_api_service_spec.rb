require "rails_helper"

describe "PetFinder API Service" do
  it "returns a random pet ID" do
    VCR.use_cassette("petfinder_get_random_pet") do
      service = PetFinderService.new

      results = service.daily_pet

      expect(results).to be_a Hash
      expect(results).to have_key :petfinder
      expect(results[:petfinder]).to have_key :petIds
      expect(results[:petfinder][:petIds]).to have_key :id
      expect(results[:petfinder][:petIds][:id]).to have_key :$t
    end
  end
  # xit "returns a pet's information by ID" do
  #
  # end
  #
  # xit "returns a collection of pets based on search params" do
  #
  # end
end
