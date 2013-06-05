require 'spec_helper'

describe "Search for a Patient" do
  context "when search query is valid" do
    it "returns a list of results" do
      visit patients_path
      fill_in 'query_string', with: 'H'
      expect(page).to have_content("Hadfield")
    end
    #failing - Factory? jQuery?
    #not running when I run whole suite - WTF
  end
end
