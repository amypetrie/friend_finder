require "rails_helper"

describe "GET /api/v1/search" do
  it "returns a collection of pet results based on queried params" do

    # uri_template = Addressable::Template.new "api.petfinder.com/pet.find"
    # stub_request(:get, uri_template).
    #   to_return(body: File.read("./spec/fixtures/petfinder_find_pet_results.json"))

    get '/api/v1/search?location=denver,co'

    response_back = JSON.parse(response.body, symbolize_names: true)

    expect(response.status).to eq(200)
    expect(response_back).to have_key :data
    expect(response_back[:data]).to be_an Array
    expect(response_back[:data].length).to eq 25
    expect(response_back[:data].first).to have_key :attributes
    expect(response_back[:data].first[:attributes]).to have_key :petfinder_id
    expect(response_back[:data].first[:attributes]).to have_key :picture_url
    expect(response_back[:data].first[:attributes]).to have_key :location
    expect(response_back[:data].first[:attributes]).to have_key :contact_email
    expect(response_back[:data].first[:attributes]).to have_key :sex
    expect(response_back[:data].first[:attributes]).to have_key :animal_type
    expect(response_back[:data].first[:attributes]).to have_key :description
  end
end
