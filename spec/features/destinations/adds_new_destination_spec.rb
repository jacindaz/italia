require 'rails_helper'

feature 'saving a new destination' do

  context "with appropriate factories" do
    let(:destination_create) { FactoryGirl.create(:destination_with_address) }
    let(:destination) { FactoryGirl.build(:destination_with_address) }

    scenario 'user creates a new destination using a pre-existing address' do
      visit new_destination_path(destination)

      within(".new-destination") do
        fill_in "Destination Name", with: destination.name
        fill_in "Hours", with: destination.hours
        fill_in "Website", with: destination.destination_website
        fill_in "Description", with: destination.description

        select "#{destination.address.address}, #{destination.address.city.english_name} #{destination.address.zip}, #{destination.address.city.region.country.english_name}", from: "Select an Address"
        select destination.category.titleize, from: "Category"
        fill_in "Cost", with: destination.cost

        within(".existing-address-submit") do 
          click_on "Save"
        end
      end

      destination = Destination.last
      expect(current_path).to eq destination_path(destination)

      expect(page).to have_content destination.name
      expect(page).to have_content "About #{destination.name}"
      expect(page).to have_content destination.destination_website
    end

    scenario 'user creates a new destination with a new address' do 
    end

    scenario 'user entering a blank destination should see appropriate errors' do
      visit new_destination_path
      click_on "Save"
      expect(page).to have_content "Your destination couldn't be saved because:"
    end
  end

end