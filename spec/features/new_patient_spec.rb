require 'spec_helper'

describe "New Patient" do

  it "has a valid factory" do
    expect(create(:patient)).to be_valid
  end

  it "is invalid without a first name" do
    expect(build(:patient, first_name: nil)).to have(1).errors_on(:first_name)
  end

  it "is invalid without a last name" do
    expect(build(:patient, last_name: nil)).to have(1).errors_on(:last_name)
  end

  it "returns a patient's full name as a string" do
    patient = FactoryGirl.build(:patient,
      first_name: "Sheila", last_name: "Hanlon")
    expect(patient.name).to eq "Sheila Hanlon"
  end

  context "when a patient submits an intake form for the first time" do
    it "redirects to patients#show" do
      visit new_patient_path
      fill_in 'patient[first_name]', with: "Jen"
      fill_in 'patient[last_name]', with: "Eliuk"
      click_button 'Create Patient'
      expect(page).to have_content("Jen", "Eliuk")
    end
  end

end
