class AddAdminToProfessional < ActiveRecord::Migration[7.1]
  def change
    add_column :professionals, :admin, :boolean
  end
end
