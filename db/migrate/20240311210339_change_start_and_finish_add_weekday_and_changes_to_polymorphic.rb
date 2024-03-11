class ChangeStartAndFinishAddWeekdayAndChangesToPolymorphic < ActiveRecord::Migration[7.1]
  def change
    change_table :available_times do |t|
      t.remove :start
      t.remove :finish
      t.integer :weekday
      t.integer :start
      t.integer :finish
      t.references :timeable, polymorphic: true, null: false
    end
  end
end
