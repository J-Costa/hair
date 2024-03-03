class CreateHairdressers < ActiveRecord::Migration[7.1]
  def change
    create_table :hairdressers do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.string :phone

      t.timestamps
    end
  end
end
