class AddProfessionalToServices < ActiveRecord::Migration[7.1]
  def change
    add_reference :services, :professional, null: false, foreign_key: true
  end
end
