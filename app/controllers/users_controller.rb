class UsersController < ApplicationController
  def index
    render json: User.all
  end

  def show
    render json: User.find(params[:id])
  end

  def create
    patient = User.new(patient_params)
    if patient.save
      render json: patient, status: :created
    else
      render json: patient.errors, status: :unprocessable_entity
    end
  end

  def update
    patient = User.find(params[:id])
    if patient.update(patient_params)
      render json: patient
    else
      render json: patient.errors, status: :unprocessable_entity
    end
  end

  def destroy
    User.find(params[:id]).destroy
    head :no_content
  end

  private

  def patient_params
    params.require(:patient).permit(:first_name, :last_name, :email, :phone, :address, :appointment, :assigned_to, :role_code, :role_id)
  end
end
