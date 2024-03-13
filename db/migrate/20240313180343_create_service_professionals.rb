class CreateServiceProfessionals < ActiveRecord::Migration[7.1]
  def change
    create_table :service_professionals do |t|
      t.references :service, null: false, foreign_key: true
      t.references :professional, null: false, foreign_key: true

      t.timestamps
    end
  end
end
