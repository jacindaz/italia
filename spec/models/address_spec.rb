require "rails_helper"

describe "Address" do

  let(:address) { FactoryGirl.create(:address_with_city) }
  let(:city) { FactoryGirl.create(:city_with_region_country) }

  it "has a valid address factory" do
    expect(address).to be_valid
  end

  it "allows unique records to be saved" do 
    address1 = FactoryGirl.create(:address_with_city, street_address: "10 Fake Street", city: city)
    address1_copy = FactoryGirl.build(:address_with_city, street_address: "10 Fake Street", city: city)
    address2 = FactoryGirl.create(:address_with_city)

    expect(address1).to be_valid
    expect(address2).to be_valid
    expect(address1_copy).to_not be_valid
    expect {address1_copy.save!}.to raise_error(ActiveRecord::RecordInvalid)
  end

end