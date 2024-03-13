class RemoveProfessionalIdFromServices < ActiveRecord::Migration[7.1]
  def change
    remove_reference :services, :professional, index: true, foreign_key: true
  end
end
