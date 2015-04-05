require 'rails_helper'

describe 'regions/index' do
  context 'when the region object has a native language name' do 
    it 'displays the native language region name' do 
      region1 = FactoryGirl.create(:region_with_country)
      region2 = FactoryGirl.create(:region_with_country)
      assign(:regions, [region1, region2])
      assign(:country, region1.country)

      render 

      expect(rendered).to have_content region1.native_language_name
      expect(rendered).to have_content region2.native_language_name
    end
  end

end