class Admin::AvailableTimesController < Admin::BaseController
  before_action :set_resource

  def index
    @available_times = @resource.available_times
  end

  def new
    @available_time = @resource.available_times.build
  end

  def create
    if (@available_times = @resource.available_times.create(available_times_params))
      redirect_to admin_manager_index_path, notice: "Horário disponível salvo com sucesso"
    else
      render :new, status: :unprocessable_entity, alert: "Erro a salvar o horário disponível"
    end
  end

  private

  def set_resource
    if params[:professional_id]
      @resource = Professional.find(params[:professional_id])
    end

    if params[:store_id]
      @resource = Store.find(params[:store_id])
    end
  end

  def available_times_params
    params.require(:available_time).require(:available_times).map do |available_time|
      available_time.permit(:weekday, :start, :finish, :free)
    end
  end
end
