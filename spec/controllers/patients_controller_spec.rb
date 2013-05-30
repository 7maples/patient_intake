require 'spec_helper'

describe PatientsController do

  describe 'GET #index' do
    it "populates an array of patients"
    it "renders the index view"
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
