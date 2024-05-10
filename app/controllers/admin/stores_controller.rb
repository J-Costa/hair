class Admin::StoresController < Admin::BaseController
  before_action :set_store, only: %i[show edit update destroy]
  before_action :set_stores, only: %i[index create update destroy]

  def index; end

  def show; end

  def new
    @store = Store.new
  end

  def create
    @store = Store.new(store_params)

    if @store.save
      @stores = Store.all
      redirect_to admin_stores_path, notice: "Loja criada com sucesso"
    else
      render :new, status: :unprocessable_entity, alert: "Erro ao criar loja"
    end
  end

  def edit; end

  def update
    if @store.update(store_params)
      redirect_to admin_stores_path, notice: "Loja atualizada com sucesso"
    else
      render :edit, status: :unprocessable_entity, alert: "Erro ao atualizar loja"
    end
  end

  def destroy
    if @store.destroy
      redirect_to admin_stores_path, notice: "Loja excluída com sucesso"
    else
      render :index, status: :unprocessable_entity, alert: "Erro ao excluir loja"
    end
  end

  private

  def set_store
    @store = Store.find(params[:id])
  end

  def set_stores
    @stores = Store.all
  end

  def store_params
    params.require(:store).permit(:name, :phone, :address, :description, :image)
  end
end
