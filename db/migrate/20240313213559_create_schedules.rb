class CreateSchedules < ActiveRecord::Migration[7.1]
  def change
    create_table :schedules do |t|
      t.references :service, null: false, foreign_key: true
      t.references :professional, null: false, foreign_key: true
      t.references :customer, null: false, foreign_key: true
      t.integer :hour
      t.integer :duration
      t.float :price

      t.timestamps
    end
  end
end
