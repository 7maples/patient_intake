require 'spec_helper'

describe "New Patient" do
  let(:patient) { build(:patient, first_name: "Sheila", last_name: "Hanlon") }

  it "has a valid factory" do
    expect(patient).to be_valid
  end

  it "is invalid without a first name" do
    patient.first_name = nil
    expect(patient).to have(1).errors_on(:first_name)
  end

  it "is invalid without a last name" do
    patient.last_name = nil
    expect(patient).to have(1).errors_on(:last_name)
  end

  it "returns a patient's full name as a string" do
    expect(patient.name).to eq "Sheila Hanlon"
  end

  it "sends a text to the doctor when a new patient is created" do
    VCR.use_cassette('patient') do
      response = patient.send_text_message
      expect(response.status).to_not eq "failed"
    end
  end
end


