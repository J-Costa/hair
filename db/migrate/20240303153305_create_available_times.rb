class CreateAvailableTimes < ActiveRecord::Migration[7.1]
  def change
    create_table :available_times do |t|
      t.datetime :start
      t.datetime :finish
      t.boolean :free

      t.timestamps
    end
  end
end
