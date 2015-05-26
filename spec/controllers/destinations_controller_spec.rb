require 'rails_helper'

RSpec.describe DestinationsController do

  describe "GET index" do
    
    context "when there is no destination sorting" do
      it "renders all destinations" do
        @d1 = FactoryGirl.create(:destination_with_address)
        @d2 = FactoryGirl.create(:destination_with_address)

        get :index
        expect(assigns(:destinations)).to eq([@d1, @d2])
      end
    end

    context "when there is destination sorting" do 
      it "renders only that city's destinations" do
        d1 = FactoryGirl.create(:destination_with_address, english_name: "Bad destination")
        city = FactoryGirl.create(:city_with_region_country, english_name: "Jacinda City")
        address = FactoryGirl.create(:address_no_city, city: city)
        d2 = FactoryGirl.create(:destination_no_address, english_name: "Good destination", address: address)

        get :index, sort: "#{city.id}"
        expect(assigns(:destinations)).to eq([d2])
      end
    end

  end

end
