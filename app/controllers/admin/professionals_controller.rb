class Admin::ProfessionalsController < Admin::BaseController
  before_action :set_professional, only: %i[show edit update destroy]
  before_action :set_professionals, only: %i[index create update destroy]

  def index; end

  def show; end

  def new
    @professional = Professional.new
  end

  def create
    @professional = Professional.new(professional_params)

    if @professional.save
      redirect_to admin_professionals_path, notice: "Profissional criado com sucesso"
    else
      render :new, status: :unprocessable_entity, alert: "Erro ao criar profissional"
    end
  end

  def edit; end

  def update
    if @professional.update(professional_update_params)
      redirect_to admin_professionals_path, notice: "Profissional atualizado com sucesso"
    else
      render :edit, status: :unprocessable_entity, alert: "Erro ao atualizar profissional"
    end
  end

  def destroy
    if @professional.destroy
      redirect_to admin_professionals_path, notice: "Profissional excluído com sucesso"
    else
      render :index, status: :unprocessable_entity, alert: "Erro ao excluir profissional"
    end
  end

  private

  def set_professional
    @professional = Professional.find(params[:id])
  end

  def set_professionals
    @professionals = Professional.all
  end

  def professional_update_params
    params.require(:professional).permit(:name, :email, :phone, :password, :avatar)
          .merge(admin: params[:admin] || false)
  end

  def professional_params
    params.require(:professional).permit(:name, :email, :phone, :password, :avatar)
          .merge(admin: params[:admin] || false, password: "mudar@1234")
  end
end
