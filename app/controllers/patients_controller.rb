class PatientsController < ApplicationController

  def new
    @patient = Patient.new
  end

  def index
    @patients = Patient.all
    @patient = Patient.find_by_id(params[:id])
  end

  def show
    @patient = Patient.find_by_id(params[:id])
  end

  def create
    conditions = sanitize_conditions(params[:patient][:conditions])

    @patient = Patient.new(params[:patient].merge(conditions: conditions))

    if @patient.save
      @patient.send_text_message
      redirect_to patient_path(@patient)
    else
      render action: 'new'
    end
  end

  def sanitize_conditions(conditions)
    conditions ? conditions.map {|c, _| c}.reject(&:empty?) : []
  end
end

