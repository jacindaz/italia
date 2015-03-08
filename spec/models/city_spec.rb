require "rails_helper"

describe "City" do

  let(:country) { FactoryGirl.create(:country) }
  let(:region) { FactoryGirl.create(:region, country: country) }
  let(:city) { FactoryGirl.create(:city, region: region) }

  it "has a valid city factory" do
    expect(city).to be_valid
  end

  it "is invalid when english or native language name is blank" do
    english_name_blank_city = FactoryGirl.build(:city, english_name: '', region: region)
    native_language_name_blank_city = FactoryGirl.build(:city, native_language_name: '', region: region)

    expect(english_name_blank_city).not_to be_valid
    expect(english_name_blank_city.errors[:english_name].size).to eq(1)
    expect(english_name_blank_city.errors[:english_name]).to include("can't be blank")

    expect(native_language_name_blank_city).not_to be_valid
    expect(native_language_name_blank_city.errors[:native_language_name].size).to eq(1)
    expect(native_language_name_blank_city.errors[:native_language_name]).to include("can't be blank")
  end

end