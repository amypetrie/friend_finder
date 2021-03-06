require "rails_helper"

describe "PetFinder API Service" do

  it "returns a random pet ID" do
    VCR.use_cassette("petfinder_get_random_pet") do
      service = PetFinderService.new

      results = service.get_random_pet

      expect(results).to be_a Hash
      expect(results).to have_key :petfinder
      expect(results[:petfinder]).to have_key :petIds
      expect(results[:petfinder][:petIds]).to have_key :id
      expect(results[:petfinder][:petIds][:id]).to have_key :$t
    end
  end

  it "returns a pet's information by ID" do
    VCR.use_cassette("petfinder_get_pet_by_id") do
      service = PetFinderService.new

      results = service.get_pet_by_id(44046167)

      expect(results).to be_a Hash
      expect(results).to have_key :petfinder
      expect(results[:petfinder]).to have_key :pet
      expect(results[:petfinder][:pet]).to have_key :age
      expect(results[:petfinder][:pet]).to have_key :size
      expect(results[:petfinder][:pet]).to have_key :media
      expect(results[:petfinder][:pet]).to have_key :breeds
      expect(results[:petfinder][:pet]).to have_key :sex
      expect(results[:petfinder][:pet]).to have_key :description
      expect(results[:petfinder][:pet]).to have_key :animal
      expect(results[:petfinder][:pet]).to have_key :status
      expect(results[:petfinder][:pet]).to have_key :contact
    end
  end

  it "returns a collection of pets based on search params" do
    VCR.use_cassette("petfinder_search_pets") do
      service = PetFinderService.new

      filter = {"location": "denver,co", "sex": "M", "animal": "dog"}
      results = service.search(filter)

      expect(results).to be_a Hash
      expect(results).to have_key :petfinder
      expect(results[:petfinder]).to have_key :lastOffset
      expect(results[:petfinder]).to have_key :pets
      expect(results[:petfinder][:pets]).to have_key :pet
      expect(results[:petfinder][:pets][:pet]).to be_an Array
      expect(results[:petfinder][:pets][:pet].length).to eq 25
      expect(results[:petfinder][:pets][:pet].first).to have_key :name
    end
  end
end
