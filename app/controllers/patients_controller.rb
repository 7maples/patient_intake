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
    #clean up conditions data before saving
    # conditions = params[:patient][:conditions]
    # conditions.map {|c, _| c}
    #   params[:patient][:conditions] = conditions
    @patient = Patient.new(params[:patient])
    if @patient.save
      redirect_to patient_path(@patient)
    else
      render action: 'new'
    end
  end
end

