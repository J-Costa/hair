class CreateCustomers < ActiveRecord::Migration[7.1]
  def change
    create_table :customers do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.string :phone
      t.string :sex

      t.timestamps
    end
  end
end
