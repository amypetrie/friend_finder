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
    @_sex ||= filter[:petfinder][:pet][:sex][:$t]
  end

  def animal_type
    @_animal_type ||= filter[:petfinder][:pet][:animal][:$t]
  end

  def location
    @_location ||= filter[:petfinder][:pet][:contact][:city][:$t].to_s + ", " + filter[:petfinder][:pet][:contact][:state][:$t].to_s
  end

  def description
    @_description ||= filter[:petfinder][:pet][:description][:$t]
  end

  def contact_email
    @_contact_email ||= filter[:petfinder][:pet][:contact][:email][:$t]
  end

  def picture_url
    @_picture_url ||= filter[:petfinder][:pet][:media][:photos][:photo].last[:$t]
  end

  def petfinder_id
    @_petfinder_id ||= filter[:petfinder][:pet][:id][:$t]
  end

  def name
    @_name ||= filter[:petfinder][:pet][:name][:$t]
  end
end
