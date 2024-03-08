class AddStoreRefToAvailableTimes < ActiveRecord::Migration[7.1]
  def change
    add_reference :available_times, :store, null: false, foreign_key: true
  end
end
