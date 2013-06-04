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
    #clean up conditions data before saving
    # conditions = params[:patient][:conditions]
    # conditions = conditions.map {|c, _| c}
    #   params[:patient][:conditions] = conditions
    @patient = Patient.new(params[:patient])
    if @patient.save
      @patient.send_text_message
      redirect_to patient_path(@patient)
    else
      render action: 'new'
    end
  end

  def search_for_patient
    # new_stocker = Customer.find_by_email(params[:email])
    # if new_stocker.nil?
    #   Resque.enqueue(SignUpEmail, current_user.id, params[:email])
    #   redirect_to :back, notice: "User does not have an account, email invitation sent."
    # elsif new_stocker.store_stocker?(current_store)
    #   redirect_to :back, notice: "User is already an stocker for your store."
    # else
    #   Store.include_stocker(new_stocker.id, current_store.id)
    #   Resque.enqueue(NewStoreStockerEmail, new_stocker.id,current_store.id)

    #   redirect_to :back, notice: "User assigned as a stocker."
    # end
  end
end

