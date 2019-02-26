require "rails_helper"

describe "GET /api/v1/daily_animal" do
  it "returns a random animal" do
    uri_template = Addressable::Template.new "api.petfinder.com/pet.getRandom"
    stub_request(:get, uri_template).
      to_return(body: File.read("./spec/fixtures/bing_map_results.json"))

    get '/api/v1/daily_pet'

    response_back = JSON.parse(response.body, symbolize_names: true)

    expect(response.status).to eq(201)
  end
end
