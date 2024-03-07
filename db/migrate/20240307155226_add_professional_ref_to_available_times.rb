class AddProfessionalRefToAvailableTimes < ActiveRecord::Migration[7.1]
  def change
    add_reference :available_times, :professional, null: false, foreign_key: true
  end
end
