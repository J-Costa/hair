class Admin::AvailableTimesController < Admin::BaseController
  before_action :set_resource
  before_action :set_available_times, only: %i[update_all index]

  def index; end

  def new
    @available_time = @resource.available_times.build
  end

  def create
    if (@available_times = @resource.available_times.create(available_times_params))
      redirect_to polymorphic_path([:admin, @resource, :available_times]), notice: "Horários disponíveis salvos com sucesso"
    else
      render :new, status: :unprocessable_entity, alert: "Erro a salvar o horário disponível"
    end
  end

  def update_all
    if params["_method"] == "put"
      @available_times = @resource.available_times.where(id: update_all_params.map { |at| at[:id] })
      @available_times.each do |at|
        at.update(update_all_params.find { |uap| uap[:id] == at.id.to_s })
      end
      return redirect_to polymorphic_path([:admin, @resource, :available_times]), notice: "Horários disponíveis atualizados com sucesso"
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

  def update_all_params
    params.require("[available_times]").map do |available_time|
      available_time.permit(:id, :weekday, :start, :finish, :free)
    end
  end

  def set_available_times
    @available_times = @resource.available_times
  end
end
