require "rails_helper"

describe "GET /api/v1/daily_pet" do
  it "returns a random pet" do
    # uri_template = Addressable::Template.new "api.petfinder.com/pet.getRandom"
    # stub_request(:get, uri_template).
    #   to_return(body: File.read("./spec/fixtures/petfinder_find_pet_results.json"))

    get '/api/v1/daily_pet'

    response_back = JSON.parse(response.body, symbolize_names: true)

    expect(response.status).to eq(200)
    expect(response_back).to have_key :data
    expect(response_back[:data]).to have_key :attributes
    expect(response_back[:data][:attributes]).to have_key :name
    expect(response_back[:data][:attributes]).to have_key :petfinder_id
    expect(response_back[:data][:attributes]).to have_key :picture_url
    expect(response_back[:data][:attributes]).to have_key :location
    expect(response_back[:data][:attributes]).to have_key :contact_email
    expect(response_back[:data][:attributes]).to have_key :sex
    expect(response_back[:data][:attributes]).to have_key :animal_type
    expect(response_back[:data][:attributes]).to have_key :description
  end
end
