require "rails_helper"

describe "Destination" do

  let(:destination_no_address) { FactoryGirl.build(:destination_no_address) }
  let(:destination_with_address) { FactoryGirl.create(:destination_with_address) }

  # let(:destination_hour) { FactoryGirl.create(:destination_hour) }

  it "has a valid destination factory" do
    destination_no_address.address = FactoryGirl.create(:address_with_city)
    expect(destination_no_address).to be_valid
    expect(destination_with_address).to be_valid
    # expect(destination_hour).to be_valid
  end

end