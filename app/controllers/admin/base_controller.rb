class Admin::BaseController < ApplicationController
  before_action :check_admin

  private

  def check_admin
    return if current_professional&.admin?

    redirect_to root_path, alert: "Acesso negado"
  end
end
