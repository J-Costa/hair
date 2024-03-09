class RemoveStartAndFinishFromAvailableTimes < ActiveRecord::Migration[7.1]
  def change
    remove_column :available_times, :start, :datetime
    remove_column :available_times, :finish, :datetime
    add_column :available_times, :start, :integer
    add_column :available_times, :finish, :integer
    add_column :available_times, :day, :integer
  end
end
