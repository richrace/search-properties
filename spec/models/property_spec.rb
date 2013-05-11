require 'spec_helper'

describe Property do
  
  before(:each) do
    @prop = Property.new(:name => "Sizeable house",
                         :bedroom_count => 2,
                         :latitude => 51.501000,
                         :longitude => -0.142000)
  end

  after(:each) do
    Property.find(:all).each {|property| property.destroy}
  end

  describe "#geocode" do

    it "a Property can have the address generated from lat/long coord" do    
      @prop.valid?  
      @prop.address.should_not be_nil
    end

    it "will get nearby properties within 20km of London" do
      location_string = "london"
      @prop.save
      found = Property.near(location_string, 20, :units => "km", :order => "distance")
      found.first.should eq @prop
    end

    it "will get incorrect distance nearby properties within 20km of Esher" do
      location_string = "esher"
      @prop.save
      found = Property.near(location_string, 20, :units => "km", :order => "distance")
      found.first.distance_from("esher", :km).should > 20
    end

  end

  describe "#find_near_by" do

    it "will get no properties within 20km of Esher" do
      location_string = "esher"
      @prop.save
      found = Property.find_near_by(location_string, 20, :km)
      found.should be_empty
    end

    it "will get a property within 20km of Esher" do
      close_prop = Property.new(:name => "house",
                                   :bedroom_count => 2,
                                   :latitude => 51.405417,
                                   :longitude => -0.265560)
      close_prop.save
      location_string = "esher"
      found = Property.find_near_by(location_string, 20, :km)
      found.first.should eq close_prop
    end

  end

end
