class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :last_name
      t.string :first_name
      t.string :email
      t.string :phone
      t.string :address
      t.boolean :flag

      t.timestamps null: false
    end
  end
end
