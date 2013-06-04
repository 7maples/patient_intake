require 'spec_helper'

describe PatientsController do

  describe 'GET #index' do
    it "renders the index view" do
      get :index
      expect(response).to render_template :index
    end
  end

  describe 'GET #show' do
    it "renders the show template" do
      patient = create(:patient)
      get :show, id: patient
      #had to create patient and pass id to show for this test
      #to work
      expect(response).to render_template :show
    end

  end

  describe 'POST #create' do
    context "with valid attributes" do

      it "saves the new patient in the database" do
       VCR.use_cassette('patient') do
        expect{
          post :create, patient: attributes_for(:patient)
          }.to change(Patient, :count).by(1)
        end
      end

      it "redirects to #show" do
        VCR.use_cassette('patient') do
          post :create, patient: attributes_for(:patient)
          patient = Patient.first
          expect(response).to redirect_to patient_path(patient)
        end
      end
    end

    context "with invalid attributes" do
      it "does not save the patient to the database" do
        expect{
          post :create, patient: attributes_for(:invalid_patient)
        }.to_not change(Patient, :count)
      end
    end
  end
end
