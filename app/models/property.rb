class Property < ActiveRecord::Base
  attr_accessible :address, :bedroom_count, :latitude, :longitude, :name

  validates_presence_of :bedroom_count
  validates_presence_of :latitude
  validates_presence_of :longitude
  validates_presence_of :name

  validates_numericality_of :bedroom_count

  reverse_geocoded_by :latitude, :longitude

  after_validation :reverse_geocode 

end
