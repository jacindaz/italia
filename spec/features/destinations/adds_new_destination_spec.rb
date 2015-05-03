require 'rails_helper'

feature 'saving a new destination' do

  context "with appropriate factories" do
    let(:destination) { FactoryGirl.build(:destination_with_address) }
    let(:destination_no_address) { FactoryGirl.build(:destination_no_address) }

    scenario 'user creates a new destination with a new address with an image' do 
      city = FactoryGirl.create(:city_with_region_country)
      address = FactoryGirl.build(:address_no_city, city: city)

      visit new_destination_path(:destination_no_address)

      within(".new-destination") do
        fill_in "Destination English Name", with: destination.english_name
        fill_in "Hours", with: destination_no_address.hours
        select destination_no_address.category.titleize, from: "Category"
        fill_in "Cost", with: destination_no_address.cost
        attach_file('destination_image', File.join(Rails.root, 'spec', 'fixtures', 'files', 'test.jpeg'))
      end

      fill_in "Street Address", with: address.street_address
      select address.city.english_name, from: "Select a City"
      click_on "Save"

      destination = Destination.last
      expect(current_path).to eq destination_path(destination)

      expect(page).to have_content destination.english_name
      expect(page).to have_content destination.address.street_address
      expect(page).to have_css("img[src*='test.jpeg']")
    end

    scenario 'user creates a new destination with a new address without an image' do 
      city = FactoryGirl.create(:city_with_region_country)
      address = FactoryGirl.build(:address_no_city, city: city)

      visit new_destination_path(:destination_no_address)

      within(".new-destination") do
        fill_in "Destination English Name", with: destination.english_name
        fill_in "Destination Native Language Name", with: destination.native_language_name
        fill_in "Hours", with: destination_no_address.hours
        fill_in "Website", with: destination_no_address.destination_website
        fill_in "Description", with: destination_no_address.description
        select destination_no_address.category.titleize, from: "Category"
        fill_in "Cost", with: destination_no_address.cost
      end

      fill_in "Street Address", with: address.street_address
      fill_in "Phone number", with: address.phone_number 
      select address.city.english_name, from: "Select a City"
      fill_in "Zipcode", with: address.zip
      click_on "Save"

      destination = Destination.last
      expect(current_path).to eq destination_path(destination)

      expect(page).to have_content destination.english_name
      expect(page).to have_content destination.native_language_name
      expect(page).to have_content destination.description
      expect(page).to have_content destination.destination_website
      expect(page).to have_content destination.address.street_address
    end

    scenario 'user submitting a blank destination without an address should see appropriate errors' do
      visit new_destination_path(destination_no_address)
      click_on "Save"
      
      expect(page).to have_content "Your destination couldn't be saved because:"
      expect(page).to have_content "English Name can't be blank"

      expect(page).to have_content "Your destination couldn't be saved because:"
      expect(page).to have_content "Street Address can't be blank"
    end

  end 

  scenario 'user is able to upload an image to an existing destination' do 
    destination = FactoryGirl.create(:destination_with_address)
    visit edit_destination_path(destination)
    
    attach_file('destination_image', File.join(Rails.root, 'spec', 'fixtures', 'files', 'test.jpeg'))
    click_on "Save"
    # page.find('.btn').click

    expect(current_path).to eq destination_path(Destination.last)
    expect(page).to have_css("img[src*='test.jpeg']")
  end

end