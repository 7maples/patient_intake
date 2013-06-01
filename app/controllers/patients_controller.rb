class PatientsController < ApplicationController

  def new
    @patient = Patient.new
  end

  def index
    @patients = Patient.all
  end

  def show
    @patient = Patient.find_by_id(params[:id])
  end

  def create
    @patient = Patient.new(params[:patient])
    @patient.save
    redirect_to patient_path(@patient)
  end
end
