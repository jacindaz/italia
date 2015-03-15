require "rails_helper"

describe "City" do

  let(:country) { FactoryGirl.create(:country) }
  let(:region) { FactoryGirl.create(:region, country: country) }
  let(:city) { FactoryGirl.create(:city, region: region) }
  let(:city_with_region_country) { FactoryGirl.create(:city_with_region_country) }

  it "has a valid city factory" do
    expect(city).to be_valid
    expect(city_with_region_country).to be_valid
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

  it "allows unique records to be saved" do 
    city1 = FactoryGirl.create(:city, english_name: "Venice", region: region)
    city1_copy = FactoryGirl.build(:city, english_name: "Venice", region: region)
    city2 = FactoryGirl.create(:city, english_name: "Naples", region: region)

    expect(city1).to be_valid
    expect(city2).to be_valid
    expect(city1_copy).to_not be_valid
    expect {city1_copy.save!}.to raise_error(ActiveRecord::RecordInvalid)
  end

end