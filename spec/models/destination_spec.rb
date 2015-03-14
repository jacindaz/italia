require "rails_helper"

describe "Destination" do

  let(:destination) { FactoryGirl.create(:destination) }
  # let(:destination_hour) { FactoryGirl.create(:destination_hour) }

  it "has a valid destination factory" do
    expect(destination).to be_valid
    # expect(destination_hour).to be_valid
  end

end