class ApplicationController < ActionController::Base
  before_action :set_current_user
  helper_method :current_professional, :current_customer, :current_user

  def current_user
    current_professional || current_customer
  end

  def current_professional
    @current_professional ||= session[:professional_id] && Professional.find_by(id: session[:professional_id])
  end

  def current_customer
    @current_customer ||= session[:customer_id] && Customer.find_by(id: session[:customer_id])
  end

  private

  def set_current_user
    @current_user ||= current_user
  end
end
