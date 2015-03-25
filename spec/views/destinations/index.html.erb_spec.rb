require "spec_helper"

describe 'destinations' do
  context 'when the product has a url' do
    it 'displays the url' do
      assign(:product, build(:product, url: 'http://example.com')

      render

      expect(rendered).to have_link 'Product', href: 'http://example.com'
    end
  end

  context 'when the product url is nil' do
    it "displays 'None'" do
      assign(:product, build(:product, url: nil)

      render

      expect(rendered).to have_content 'None'
    end
  end
end