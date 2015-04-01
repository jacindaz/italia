require 'rails_helper'

feature 'updating a destination' do

  context "with appropriate factories" do
    let(:destination) { FactoryGirl.create(:destination_with_address) }

    let(:city) { FactoryGirl.create(:city_with_region_country) }
    let(:address) { FactoryGirl.create(:address_no_city, city: city) }
    let(:destination_no_address) { FactoryGirl.create(:destination_no_address, address: address) }

    scenario 'user updates destination without changes to address' do 
      destination.english_name = "Updated destination english name"
      destination.description = "Updated destination description blah blah blah"

      visit edit_destination_path(destination)
      fill_in "Destination English Name", with: destination.english_name
      fill_in "Description", with: destination.description

      click_on "Save"

      expect(current_path).to eq destination_path(destination)
      expect(page).to have_content destination.english_name
      expect(page).to have_content destination.description
    end

    scenario 'user only updates address, no changes to destination' do 
      updated_address = address
      updated_address.street_address = "576 Updated street address"
      updated_address.city = FactoryGirl.create(:city_with_region_country, english_name: "Citie Nouveau")
      destination.address = updated_address

      visit edit_destination_path(destination)
      check "Edit the current address"

      fill_in "Street Address", with: updated_address.street_address
      select updated_address.city.english_name, from: "Select a City"

      click_on "Save"

      expect(current_path).to eq destination_path(destination)
      expect(page).to have_content updated_address.street_address
      expect(page).to have_content updated_address.city.english_name
    end

  end

end