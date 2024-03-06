class CustomersController < ApplicationController

  def new; end

  def create
    @customer = Customer.new(customer_params)
    if @customer.save
      session[:customer_id] = @customer.id
      redirect_to services_path, notice: "Conta criada com sucesso!"
    else
      render :new, status: :unprocessable_entity, alert: "Erro ao criar conta!"
    end
  end

  private

  def customer_params
    params.require(:customer).permit(:name, :email, :phone, :password, :password_confirmation)
  end
end
