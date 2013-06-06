require 'spec_helper'

describe "Search for a Patient", js: true do
  context "when search query is valid" do
    it "returns a list of results" do
      create(:patient)
      visit patients_path
      fill_in 'query_string', with: 'H'
      click_link 'patient-search'
      expect(page).to have_content("Hadfield")
    end
  end
end


