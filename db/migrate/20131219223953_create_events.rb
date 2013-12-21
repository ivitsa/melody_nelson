class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :headline
      t.text :description
      t.datetime :time

      t.timestamps
    end
  end
end
