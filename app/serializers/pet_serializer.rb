class PetSerializer
  include FastJsonapi::ObjectSerializer

  attribute :name do |obj|
    obj.name
  end

  attribute :petfinder_id do |obj|
    obj.petfinder_id
  end

  attribute :picture_url do |obj|
    obj.picture_url
  end

  attribute :location do |obj|
    obj.location
  end

  attribute :sex do |obj|
    obj.sex
  end

  attribute :contact_email do |obj|
    obj.contact_email
  end

  attribute :description do |obj|
    obj.description
  end

  attribute :animal_type do |obj|
    obj.animal_type
  end

end
