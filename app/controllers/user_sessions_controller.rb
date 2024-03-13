class UserSessionsController < ApplicationController
  def new; end

  def create
    session.clear
    @user = Customer.find_by(email: params[:user][:email]) || Professional.find_by(email: params[:user][:email])
    user_type = @user.class.name.downcase

    if @user&.authenticate(params[:user][:password])
      session["#{user_type}_id".to_sym] = @user.id
      #TODO: Verificar como redirecionar correamten, se bem que, nao precisa verificar
      return redirect_to params[:path] if params[:path]

      redirect_to services_path
    else
      session.clear
      flash.now[:alert] = "Falha no login, verifique seus dados e tente novamente!"
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    session.clear
    redirect_to root_path
  end
end
