require 'spec_helper'

describe ParseSearchString do

  before(:all) do
    @parser = ParseSearchString.new
  end

  describe "#find_bedrooms" do

    it "will detect string with 'bedroom'" do
      search_string = "1 bedroom house"
      @parser.find_bedrooms(search_string).should eq 1
    end

    it "will detect string with 'bedrooms'" do
      search_string = "2 bedrooms house"
      @parser.find_bedrooms(search_string).should eq 2
    end

    it "will detect string with 'bed'" do
      search_string = "1 bed house"
      @parser.find_bedrooms(search_string).should eq 1
    end

    it "will detect string with 'beds'" do
      search_string = "2 beds house"
      @parser.find_bedrooms(search_string).should eq 2
    end

    it "won't fail when no number of bedrooms supplied" do
      search_string = "bedroom house"
      @parser.find_bedrooms(search_string).should eq 0
    end

    it "will get the number of bedrooms if something is before the bedroom info" do
      search_string = "house 1 bedroom"
      @parser.find_bedrooms(search_string).should eq 1
    end

    it "doesn't care about case uses 'BEdRoom'" do
      search_string = "house 1 BEdRoom"
      @parser.find_bedrooms(search_string).should eq 1
    end

    it "will detect string with written number 'one'" do
      search_string = "one bed house"
      @parser.find_bedrooms(search_string).should eq 1
    end

    it "will detect string with written number 'two'" do
      search_string = "two bed house"
      @parser.find_bedrooms(search_string).should eq 2
    end

    it "will detect string with lots of whitespace between '1    bed'" do
      search_string = "1     bed house"
      @parser.find_bedrooms(search_string).should eq 1
    end

  end

  describe "#find_property_type" do

    it "will detect string with 'flat'" do
      search_string = "1 bedroom flat"
      @parser.find_property_type(search_string).should eq "flat"
    end

    it "will detect string with 'house'" do
      search_string = "1 bedroom house"
      @parser.find_property_type(search_string).should eq "house"
    end

    it "will detect string with 'flats'" do
      search_string = "1 bedroom flats"
      @parser.find_property_type(search_string).should eq "flat"
    end

    it "will detect string with 'houses'" do
      search_string = "1 bedroom houses"
      @parser.find_property_type(search_string).should eq "house"
    end

    it "will ignore case 'HouSe'" do
      search_string = "1 bedroom HouSe"
      @parser.find_property_type(search_string).should eq "house"
    end

    it "will ignore case FlaTs" do
      search_string = "1 bedroom FlaTs"
      @parser.find_property_type(search_string).should eq "flat"
    end

  end

  describe "#find_location" do

    it "will find just location at the end" do
      search_string = "1 bedroom flat london"
      @parser.find_location(search_string).should eq "london"
    end

    it "will find location when at the beginning" do
      search_string = "london 1 bedroom flat"
      @parser.find_location(search_string).should eq "london"
    end

    it "will find location when in the middle" do
      search_string = "1 bedroom london flat"
      @parser.find_location(search_string).should eq "london"
    end

    it "will find location when location is more than one word" do
      search_string = "1 bed flat north london"
      @parser.find_location(search_string).should eq "north london"
    end

    it "is not case sensitive" do
      search_string = "1 bed flat North LONDON"
      @parser.find_location(search_string).should eq "north london"
    end

  end

  describe "#parse_search_string" do

    it "will get a hash of search parameters" do
      expected_hash = {:bedroom_count => 1,
                       :property_type => "flat",
                       :location => "north london"}
      search_string = "1 bed flat north london"
      @parser.parse_search_string(search_string).should eq expected_hash
    end

  end

end