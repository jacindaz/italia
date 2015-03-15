require 'rails_helper'

feature 'saving a new region' do

  context "with appropriate factories" do
    let(:country) { FactoryGirl.create(:country) }
    let(:region) { FactoryGirl.build(:region, country: country) }

    scenario 'user creates a new region using a form' do
      visit new_country_region_path(country)

      within("form") do
        fill_in "region_english_name", with: region.english_name
        fill_in "region_native_language_name", with: region.native_language_name
        fill_in "region_description", with: region.description
        fill_in "region_region_website", with: region.region_website
        click_on "Save"
      end

      region = Region.last
      expect(current_path).to eq country_region_path(country, region)

      expect(page).to have_content region.english_name
      expect(page).to have_content "About #{region.native_language_name}"
      expect(page).to have_content region.region_website
    end

    scenario 'user entering a blank region should see appropriate errors' do
      visit new_country_region_path(country, region)
      click_on "Save"
      expect(page).to have_content "Your region couldn't be saved because:"
    end
  end

end