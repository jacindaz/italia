require 'rails_helper'

RSpec.describe DestinationsController do

  describe "GET index" do
    context "when there is no destination sorting" do
      it "renders all destinations" do
        d1 = FactoryGirl.create(:destination_with_address)
        d2 = FactoryGirl.create(:destination_with_address)

        get :index
        expect(assigns(:destinations)).to eq([d1, d2])
      end
    end

    context "when there is destination sorting" do 
      it "renders only that city's destinations" do
      end
    end

  end

end
