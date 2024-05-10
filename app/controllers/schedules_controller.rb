class SchedulesController < ApplicationController
  before_action :authenticate_user!

  def create
    @service = Service.find(params[:service_id])
    @professionals = @service.professionals
    @customer = current_customer
    @schedule = Schedule.new(schedule_params)
    if @schedule.save
      redirect_to my_schedules_path, notice: "Agendamento realizado com sucesso!"
    else
      render :index, status: :unprocessable_entity, alert: "Não foi possível realizar o agendamento"
    end
  end

  def index
    @service = Service.find(params[:service_id])
    @professionals = @service.professionals
    @customer = current_customer
    @existing_schedules = Schedule.where(customer_id: @customer&.id, service_id: @service.id).pluck(:professional_id, :date, :hour)
  end

  def my_schedules
    @schedules = if current_customer
                   Schedule.where(customer_id: current_customer.id)
                 elsif current_professional
                   Schedule.where(professional_id: current_professional.id)
                 end
    @schedules = @schedules.order(:date, :hour)
  end

  private

  def authenticate_user!
    return if current_user

    redirect_to login_path
  end

  def schedule_params
    params.permit(:professional_id, :customer_id, :service_id, :date, :hour, :duration, :price)
  end
end
