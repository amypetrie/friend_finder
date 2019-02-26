class Pet
  attr_reader :id,
              :name,
              :filter

  def initialize(filter)
    @filter = filter
    @id = Time.now
    @_petfinder_id = nil
    @_name = nil
    @_location = nil
    @_description = nil
    @_picture_url = nil
    @_contact_email = nil
    @_animal_type = nil
    @_sex = nil
  end

  def sex
    @_sex ||= filter[:sex][:$t]
  end

  def animal_type
    @_animal_type ||= filter[:animal][:$t]
  end

  def location
    @_location ||= filter[:contact][:city][:$t].to_s + ", " + filter[:contact][:state][:$t].to_s
  end

  def description
    @_description ||= filter[:description][:$t]
  end

  def contact_email
    @_contact_email ||= filter[:contact][:email][:$t]
  end

  def picture_url
    @_picture_url ||= filter[:media][:photos][:photo].last[:$t] unless filter[:media][:photos] == nil
  end

  def petfinder_id
    @_petfinder_id ||= filter[:id][:$t]
  end

  def name
    @_name ||= filter[:name][:$t]
  end
end
