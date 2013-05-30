class PatientsController < ApplicationController

  def new
    @patient = Patient.new
  end

  def index
    @patients = Patient.all
  end

  def show
  end

  def create
    @patient = Patient.new(params[:patient])
    redirect_to patients_path
  end
end
