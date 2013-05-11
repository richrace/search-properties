require 'spec_helper'

describe "properties/new" do
  before(:each) do
    assign(:property, stub_model(Property,
      :name => "MyString",
      :bedroom_count => 1,
      :latitude => 1.5,
      :longitude => 1.5,
      :address => "MyString"
    ).as_new_record)
  end

  it "renders new property form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", properties_path, "post" do
      assert_select "input#property_name[name=?]", "property[name]"
      assert_select "input#property_bedroom_count[name=?]", "property[bedroom_count]"
      assert_select "input#property_latitude[name=?]", "property[latitude]"
      assert_select "input#property_longitude[name=?]", "property[longitude]"
      assert_select "input#property_address[name=?]", "property[address]"
    end
  end
end
