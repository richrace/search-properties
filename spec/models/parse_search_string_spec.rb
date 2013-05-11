require 'spec_helper'

describe ParseSearchString do

  describe "#find_bedrooms" do

    before(:all) do
      @parser = ParseSearchString.new
    end

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

  end

end