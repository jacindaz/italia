require 'rails_helper'

describe 'countries/index' do
  context 'when the country object has a native language name' do 
    it 'displays the native language country name' do 
      country1 = FactoryGirl.create(:country)
      country2 = FactoryGirl.create(:country)
      assign(:countries, [country1, country2])

      render 

      expect(rendered).to have_content country1.english_name
      expect(rendered).to have_content country2.english_name
    end
  end

end