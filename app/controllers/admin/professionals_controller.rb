class Admin::ProfessionalsController < ApplicationController
  before_action :check_admin

  def index
    @professionals = Professional.all
  end

  def new
    @professional = Professional.new
  end

  def create
    binding.break
    @professional = Professional.new(professional_params)

    if @professional.save
      render :show
    else
      render :new, status: :unprocessable_entity, alert: "Erro ao criar profissional"
    end
  end

  private

  def check_admin
    return if @current_professional.admin?

    render :index, status: :unauthorized, alert: "Acesso negado"
  end

  def professional_params
    params.require(:professional).permit(:name, :email, :phone, :password)
          .merge(admin: params[:admin] || false, password: "mudar@1234")
  end
end
