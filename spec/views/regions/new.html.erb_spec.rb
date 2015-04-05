require 'rails_helper'

describe 'regions/new' do
  context 'when filling out the new region form' do 
    it 'displays the form properly' do 
      region = FactoryGirl.build(:region_with_country)
      assign(:region, region)
      assign(:country, region.country)

      render 

      expect(rendered).to have_content "Name in english"
    end
  end

end