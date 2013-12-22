class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :name
      t.string :address
      t.string :phone
      t.string :opening_hours
      t.string :facebook
      t.string :email

      t.timestamps
    end
  end
end
