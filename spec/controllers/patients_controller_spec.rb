require 'spec_helper'

describe PatientsController do

  describe 'GET #index' do
    it "populates an array of patients" do
      patient = Patient.create(first_name: "Sheila", last_name: "Hanlon")
      get :index
      expect(assigns(:patients)).to match_array [patient]
    end

    it "renders the index view" do
      get :index
      expect(response).to render_template :index
    end
  end

  describe 'GET #show' do
    it "renders the show template"
    it "displays the patient's data"
  end

  describe 'POST #create' do
    context "with valid attributes" do
      it "saves the new patient in the database"
      it "redirects to the home page"
    end

    context "with invalid attributes" do
      it "does not save the patient to the database"
      it "re-renders the :new template with errors"
    end
  end
end
