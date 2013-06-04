require 'spec_helper'

describe "New Patient" do

  context "when a patient submits an intake form for the first time" do
    it "redirects to patients#show" do
      VCR.use_cassette('patient') do
        visit new_patient_path
        fill_in 'patient[first_name]', with: "Jen"
        fill_in 'patient[last_name]', with: "Eliuk"
        click_button 'Create Patient'
        expect(page).to have_content("Jen", "Eliuk")
      end
    end
  end
end
