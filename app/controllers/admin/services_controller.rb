class Admin::ServicesController < ApplicationController
  before_action :set_professional, :set_services
  before_action :set_service, only: [:edit, :update, :destroy]

  def new
    @service = @professional.services.new
  end

  def edit
  end

  def create
    @service = @professional.services.new(service_params)
    if @service.save
      redirect_to admin_professional_services_path(@professional), notice: "Serviço cadastrado com sucesso."
    else
      render :new, status: :unprocessable_entity, alert: "Erro ao cadastrar serviço."
    end
  end

  def update
    if @service.update(service_params)
      redirect_to admin_professional_services_path(@professional), notice: "Serviço atualizado com sucesso."
    else
      render :edit, status: :unprocessable_entity, alert: "Erro ao atualizar serviço."
    end
  end

  def index
  end

  def destroy
    @service = @services.find(params[:id])
    @service.destroy
    redirect_to admin_professional_services_path(@professional), notice: "Serviço excluído com sucesso."
  end

  private

  def set_professional
    @professional = Professional.find(params[:professional_id])
  end

  def set_services
    @services = @professional.services
  end

  def set_service
    @service = @professional.services.find(params[:id])
  end

  def service_params
    params.require(:service).permit(:name, :price, :duration, :description)
  end
end
