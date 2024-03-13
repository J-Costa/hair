class SchedulesController < ApplicationController
  before_action :authenticate_user!

  def create
  end

  def index
    @service = Service.find(params[:service_id])
    @professionals = @service.professionals
  end

  private

  def authenticate_user!
    return if current_user

    redirect_to login_path
  end
end
