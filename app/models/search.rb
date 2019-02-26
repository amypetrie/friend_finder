class Search
  attr_reader :results_filter,
              :id

  def initialize(results_filter)
    @id = Time.now
    @results_filter = results_filter
    @_results = []
  end

  def results
    @_results ||= self.create_pet_objects
  end

  def create_pet_objects
    results_filter[:petfinder][:pets][:pet].each {|pet| @_results << Pet.new(pet)}
  end

end
