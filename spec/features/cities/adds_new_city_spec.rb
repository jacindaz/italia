require 'rails_helper'

feature 'saving a new city' do

  context "with appropriate factories" do
    let(:country) { FactoryGirl.create(:country) }
    let(:region) { FactoryGirl.create(:region, country: country) }
    let(:city) { FactoryGirl.build(:city, region_id: region.id) }

    scenario 'user creates a new city using a form' do
      region = FactoryGirl.create(:region, country: country)
      visit new_country_city_path(country)

      within("form") do
        select region.english_name, from: "Select a Region"
        fill_in "city_english_name", with: city.english_name
        fill_in "city_native_language_name", with: city.native_language_name
        fill_in "city_description", with: city.description
        fill_in "city_city_website", with: city.city_website
        click_on "Save"
      end

      city = City.last
      expect(current_path).to eq country_city_path(country, city)

      expect(page).to have_content city.english_name
      expect(page).to have_content "About #{city.native_language_name}"
      expect(page).to have_content city.city_website
    end

    scenario 'user entering a blank city should see appropriate errors' do
      visit new_country_city_path(country, city)
      click_on "Save"
      expect(page).to have_content "Your city couldn't be saved because:"
    end
  end

end