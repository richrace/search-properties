require 'spec_helper'

describe Property do
  
  describe "#geocode" do
    before(:each) do
      @prop = Property.new(:name => "Sizeable house",
                           :bedroom_count => 2,
                           :latitude => 51.501000,
                           :longitude => -0.142000)
      @prop.valid?
    end

    after(:each) do
      Property.find(:all).each {|property| property.destroy}
    end

    it "a Property can have the address generated from lat/long coord" do      
      @prop.address.should_not be_nil
    end

    it "will get nearby properties within 20km of London" do
      location_string = "london"
      @prop.save
      found = Property.near(location_string, 20, :units => "km", :order => "distance")
      found.first.should eq @prop
    end

    it "will get incorrect distance nearby properties within 20km of esher" do
      location_string = "esher"
      @prop.save
      found = Property.near(location_string, 20, :units => "km", :order => "distance")
      found.first.distance_from("esher", :km).should > 20
    end

  end


end