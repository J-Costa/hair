class Admin::AvailableTimesController < Admin::BaseController
  def new
    @available_time = AvailableTime.new
  end

  def create
    @available_time = AvailableTime.new(available_time_params)
    if @available_time.save
      redirect_to admin_manager_path, notice: "Horário disponível salvo com sucesso"
    else
      render :new, status: :unprocessable_entity, alert: "Erro a salvar o horário disponível"
    end
  end

  private

  def available_time_params
    params.require(:available_time).permit(:day, :start, :finish)
  end
end
