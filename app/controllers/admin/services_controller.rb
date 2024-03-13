class Admin::ServicesController < ApplicationController
  before_action :set_professionals, only: [:new, :edit]
  before_action :set_services
  before_action :set_service, only: [:edit, :update, :destroy]

  def new
    @service = Service.new
  end

  def edit
  end

  def create
    @service = Service.new(service_params)
    unless @service.professionals.exists?(id: params[:professional_ids])
      @service.professionals << Professional.where(id: params[:professional_ids])
    end

    if @service.save
      redirect_to admin_services_path, notice: "Serviço cadastrado com sucesso."
    else
      render :new, status: :unprocessable_entity, alert: "Erro ao cadastrar serviço."
    end
  end

  def update
    unless @service.professionals.exists?(id: params[:professional_ids])
      @service.professionals << Professional.where(id: params[:professional_ids])
    end

    if @service.update(service_params)
      redirect_to admin_services_path, notice: "Serviço atualizado com sucesso."
    else
      render :edit, status: :unprocessable_entity, alert: "Erro ao atualizar serviço."
    end
  end

  def index
  end

  def destroy
    @service = @services.find(params[:id])
    @service.destroy
    redirect_to admin_services_path, notice: "Serviço excluído com sucesso."
  end

  private

  def set_professionals
    @professionals = Professional.all
  end

  def set_services
    @services = Service.all
  end

  def set_service
    @service = Service.find(params[:id])
  end

  def service_params
    params.require(:service).permit(:name, :price, :duration, :description, :image, :professional_ids)
  end
end
