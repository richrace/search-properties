class Property < ActiveRecord::Base
  attr_accessible :address, :bedroom_count, :latitude, :longitude, :name

  validates_presence_of :bedroom_count
  validates_presence_of :latitude
  validates_presence_of :longitude
  validates_presence_of :name

  validates_numericality_of :bedroom_count

  reverse_geocoded_by :latitude, :longitude

  after_validation :reverse_geocode 

  def self.find_near_by(location, distance = 20, unit = :km)
    found = Property.near(location, distance, :units => unit.to_s, :order => "  distance")
    result = []
    found.each do |entity| 
      result << entity if entity.distance_from(location, unit) < distance
    end
    result
  end

  def self.find_by_search(search_string)
    parser = ParseSearchString.new
    options = parser.parse_search_string(search_string)
    near_by_properties = Property.find_near_by(options[:location])

    filtered = []

    near_by_properties.each do |property|
      filtered << property if property.bedroom_count >= options[:bedroom_count] && property.name.downcase.include?(options[:property_type])
    end

    filtered
  end

end
