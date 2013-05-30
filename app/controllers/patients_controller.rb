class PatientsController < ApplicationController

  def new
    @patient = Patient.new
  end

  def index
    @patients = Patient.all
  end

  def show
    @patient = Patient.last
    # @patient = Patient.find(current_patient.id)
    # switch to commented out code when sessions in place
  end

  def create
    @patient = Patient.new(params[:patient])
    @patient.save
    redirect_to patient_path(@patient)
  end
end
