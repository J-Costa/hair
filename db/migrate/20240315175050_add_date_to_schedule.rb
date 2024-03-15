class AddDateToSchedule < ActiveRecord::Migration[7.1]
  def change
    add_column :schedules, :date, :date
  end
end
