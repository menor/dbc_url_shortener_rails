require 'spec_helper'

describe "Urls", js: true do
  let!(:url){FactoryGirl.create :url}
  context "index" do
    it "displays create new link" do
      visit root_path
      click_link('Shorten new url')
      expect(page).to have_content "Long url"
    end
  end
  context "new" do
    it "should create a new shortened link" do
      visit new_url_path
      fill_in "url_long_url", :with => url.long_url
      click_on "Create Url"
      expect(page).to have_content url.short_url
    end
  end
end