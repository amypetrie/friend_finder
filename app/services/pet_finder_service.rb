class PetFinderService
  # def initialize
  #   @_daily_pet = nil
  # end

  def get_random_pet
    get_json("/pet.getRandom")
  end

  def get_pet_by_id(id)
    get_json("/pet.get?id=#{id}")
  end

  def daily_pet
    result = get_random_pet
  end

  private

  def conn
    Faraday.new(url: "http://api.petfinder.com") do |f|
      f.params['key'] = ENV['petfinder_api_key']
      f.params['format'] = "json"
      f.adapter Faraday.default_adapter
    end
  end

  def get_json(uri)
    response = conn.get(uri)
    JSON.parse(response.body, symbolize_names: true)
  end

end
