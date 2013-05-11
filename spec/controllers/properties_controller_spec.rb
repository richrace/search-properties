require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

describe PropertiesController do

  # This should return the minimal set of attributes required to create a valid
  # Property. As you add validations to Property, be sure to
  # update the return value of this method accordingly.
  def valid_attributes
    { "name" => "MyString" }
  end

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # PropertiesController. Be sure to keep this updated too.
  def valid_session
    {}
  end

  describe "GET index" do
    it "assigns all properties as @properties" do
      property = Property.create! valid_attributes
      get :index, {}, valid_session
      assigns(:properties).should eq([property])
    end
  end

  describe "GET show" do
    it "assigns the requested property as @property" do
      property = Property.create! valid_attributes
      get :show, {:id => property.to_param}, valid_session
      assigns(:property).should eq(property)
    end
  end

  describe "GET new" do
    it "assigns a new property as @property" do
      get :new, {}, valid_session
      assigns(:property).should be_a_new(Property)
    end
  end

  describe "GET edit" do
    it "assigns the requested property as @property" do
      property = Property.create! valid_attributes
      get :edit, {:id => property.to_param}, valid_session
      assigns(:property).should eq(property)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Property" do
        expect {
          post :create, {:property => valid_attributes}, valid_session
        }.to change(Property, :count).by(1)
      end

      it "assigns a newly created property as @property" do
        post :create, {:property => valid_attributes}, valid_session
        assigns(:property).should be_a(Property)
        assigns(:property).should be_persisted
      end

      it "redirects to the created property" do
        post :create, {:property => valid_attributes}, valid_session
        response.should redirect_to(Property.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved property as @property" do
        # Trigger the behavior that occurs when invalid params are submitted
        Property.any_instance.stub(:save).and_return(false)
        post :create, {:property => { "name" => "invalid value" }}, valid_session
        assigns(:property).should be_a_new(Property)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Property.any_instance.stub(:save).and_return(false)
        post :create, {:property => { "name" => "invalid value" }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested property" do
        property = Property.create! valid_attributes
        # Assuming there are no other properties in the database, this
        # specifies that the Property created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Property.any_instance.should_receive(:update_attributes).with({ "name" => "MyString" })
        put :update, {:id => property.to_param, :property => { "name" => "MyString" }}, valid_session
      end

      it "assigns the requested property as @property" do
        property = Property.create! valid_attributes
        put :update, {:id => property.to_param, :property => valid_attributes}, valid_session
        assigns(:property).should eq(property)
      end

      it "redirects to the property" do
        property = Property.create! valid_attributes
        put :update, {:id => property.to_param, :property => valid_attributes}, valid_session
        response.should redirect_to(property)
      end
    end

    describe "with invalid params" do
      it "assigns the property as @property" do
        property = Property.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Property.any_instance.stub(:save).and_return(false)
        put :update, {:id => property.to_param, :property => { "name" => "invalid value" }}, valid_session
        assigns(:property).should eq(property)
      end

      it "re-renders the 'edit' template" do
        property = Property.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Property.any_instance.stub(:save).and_return(false)
        put :update, {:id => property.to_param, :property => { "name" => "invalid value" }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested property" do
      property = Property.create! valid_attributes
      expect {
        delete :destroy, {:id => property.to_param}, valid_session
      }.to change(Property, :count).by(-1)
    end

    it "redirects to the properties list" do
      property = Property.create! valid_attributes
      delete :destroy, {:id => property.to_param}, valid_session
      response.should redirect_to(properties_url)
    end
  end

end
